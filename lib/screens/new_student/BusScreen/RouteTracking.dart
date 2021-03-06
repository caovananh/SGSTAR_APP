import 'dart:convert';
import 'dart:typed_data';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/studentScreen/StudentInfoWidget/StudentInfoADM.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:http/http.dart' as http;

class RouteTracking extends StatefulWidget {
  const RouteTracking({Key key}) : super(key: key);

  @override
  _RouteTrackingState createState() => _RouteTrackingState();
}

class _RouteTrackingState extends State<RouteTracking> {
  StreamSubscription _locationSubcription;
  double latitudeNow=10.76619;
  double longtitudeNow=106.7610729;
  Marker marker; //khởi tạo marker
  GoogleMapController _controller; // khởi tạo controller
  double bus_latitude; // khởi tạo kinh độ trống
  double bus_longtitude; // khởi tạo vĩ độ trống
  double route_latitude =
      10.766; //khởi tạo kinh độ của trường saigonstar, Khi app chạy, camera sẽ tự lia đến vị trí này
  double route_longtitude =
      106.7611129; //khởi tạo vĩ độ của trường saigonstar, Khi app chạy, camera sẽ tự lia đến vị trí này
  double rotate = 0; // khởi tạo đôj xoay của camera mặc định là 0 độ
  CameraPosition _currentPosition;
  Timer timer;
  String busId;
  int _selectedBus; //khởi tạo xe bus đang được chọn
  List _listBus; //khởi tạo danh sách tất cả xe bus.
  String btn1;
  String btn2;
  String studentBusId;
  Future<Uint8List> getMarker() async {
    // Method lấy icon marker phân giải nó sang định dạng mà google map flutter có thể đọc được.
    ByteData byData = await DefaultAssetBundle.of(context)
        .load("assets/images/icons/bus_icon.png");
    return byData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(Uint8List imageData) {
    // Method cập nhật lại vị trí của marker với kinh độ ,vĩ độ và rotation thay đổi. Ví dụ khi user xoay map hình vòng tròn thì marker cũng phải xoay theo
    LatLng latlng = LatLng(bus_latitude, bus_longtitude);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
          rotation: 0 + rotate, // thiết lập xoay marker ở đây
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
    });
  }

  void getListVehicles() async {
    // Method lấy danh sách các phương tiện từ server
    final response = await http.get(Uri.parse(InfixApi.vehiclesList()));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData['data']);
      setState(() {
        _listBus = jsonData['data'];
      });
    } else {
      throw Exception('failed to load');
    }
  }
  void getStudentBus() async{
    final pref = await SharedPreferences.getInstance();
    studentBusId = pref.get('busId');
    if(studentBusId!="null"){
      getVehiclesLocation(studentBusId.toString());
      moveToRoute();
      print("upload location");
    }
    else
      print("No assign bus yet");
  }
  void getVehiclesLocation(id) async {
    // Method lấy vị trí theo id phương tiện từ server
    final response = await http.get(Uri.parse(InfixApi.vehiclesLocation(id)));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      setState(() { //set dữ liệu mới cho 2 tham số bus_latitude,bus_longtitude đã khởi tạo phía trên
        bus_latitude = jsonData['data']['latitude'];
        bus_longtitude = jsonData['data']['longtitude'];
      });
      getCurrentLocation(); // sau khi có dữ liệu kinh, vĩ độ mới thì gọi hàm này để set lại vị trí marker
      print("get bus location");
    } else {
      throw Exception('failed to load');
    }
  }
  getUserLocation() async{
    final positionGeo= await geo.Geolocator.getCurrentPosition(desiredAccuracy: geo.LocationAccuracy.high);
    setState(() {
      latitudeNow=positionGeo.latitude.toDouble();
      longtitudeNow=positionGeo.longitude.toDouble();
    });
  }

  void getCurrentLocation() async {
    try {
      //Method kiểm tra xem người dùng có đồng ý chia sẻ vị trí với thiết bị không nếu có thì gọi tiếp hàm update marker nếu không thì báo lỗi
      Uint8List imageData = await getMarker();
      updateMarkerAndCircle(imageData);
      if (_locationSubcription != null) {
        _locationSubcription.cancel();
      }
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  void moveToRoute() async {
    // Method này dùng để lia camera đến vị trí của phương tiện
    if (_controller != null) {
      _controller.animateCamera(CameraUpdate.newCameraPosition(
          new CameraPosition(
              bearing: 0,
              target: LatLng(bus_latitude, bus_longtitude),
              tilt: 0,
              zoom: 14.5)));
    }
  }

  @override
  void dispose() {
    // huỷ các hàm chạy ngầm khi thoát
    if (_locationSubcription != null) {
      _locationSubcription.cancel();
    }
    timer?.cancel();
    super.dispose();
  }
  Future<void> updateLocation(int $id,double latitude,double longtitude) async{
    final response = await http.get(Uri.parse(InfixApi.updateLocationBus($id,latitude,longtitude)));
    getVehiclesLocation(_selectedBus);
    moveToRoute();
    print("Success!");
  }

  @override
  void initState() {
    print(studentBusId);
    getUserLocation();//lấy thông tin vị trí của user khi mở App - Khoa
    //Ngay khi screen được khởi tạo xong
    _currentPosition = CameraPosition(
        target: LatLng(latitudeNow, longtitudeNow),
        zoom: 14); // lia camera đến vị trí tương ứng
    getListVehicles(); // và gọi method lấy danh sách các phương tiện


      timer = Timer.periodic(
          Duration(seconds: 5), (timer) => getStudentBus()
      );
      //Cứ mỗi 5 giây, gửi yêu cầu lên server để lấy về vị trí của phương tiện đã chọn


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SlidingUpPanel(
        minHeight: 50,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        panel: Container(
          child: slideUp(),
        ),
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _currentPosition,
          markers: Set.of((marker != null) ? [marker] : []),
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
          },
          onCameraMove: (CameraPosition _currentCamPosition) async {
            setState(() {
              rotate = _currentCamPosition.bearing;
            });
            Uint8List imageData = await getMarker();
            updateMarkerAndCircle(imageData);
          },
        ),
      ),

      floatingActionButton:Padding(
        padding: EdgeInsets.only(top: 100.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: FloatingActionButton(
                heroTag: btn1,
                child: Icon(Icons.location_searching),
                onPressed: () {
                  getVehiclesLocation(_selectedBus);
                  moveToRoute();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: FloatingActionButton(
                heroTag: btn2,
                child: Icon(Icons.refresh),
                onPressed: () {
                  updateLocation(_selectedBus,latitudeNow,longtitudeNow);
                },
              ),
            ),
          ],
        ),
      ),


    );
  }

  Widget slideUp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xff07509d)),
              height: 10,
              width: 60,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF7dd3f7), width: 2),
                borderRadius: BorderRadius.circular(30)),
            child: DropdownButton(
                hint: Text('Select Bus'),
                value: _selectedBus,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 40,
                isExpanded: true,
                style: TextStyle(color: Colors.black, fontSize: 25),
                underline: SizedBox(),
                onChanged: (newBus) {
                  setState(() {
                    _selectedBus = newBus;
                  });
                  getVehiclesLocation(newBus);
                },
                items: _listBus != null
                    ? _listBus.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem['id'],
                          child: Text(
                              '${valueItem["route"]} - BUS ${valueItem["vehicle_no"]}',style: TextStyle(fontSize: 15),),
                        );
                      }).toList()
                    : null),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0,right: 20.0),
                  child: Container(
                    child: Text("pick-up".toUpperCase(),style: TextStyle(color: Color(0xFF7dd3f7),fontWeight: FontWeight.bold),),
                  ),
                ),
                Container(
                  child: Divider(color: Color(0xFF7dd3f7),thickness: 2.0,),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0,right: 20.0),
                  child: Container(
                    child: Text("drop-off".toUpperCase(),style: TextStyle(color: Color(0xFF7dd3f7),fontWeight: FontWeight.bold)),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(left: 20.0,right: 20.0),
                //   child: Container(
                //     child: Text(latitudeNow.toString(),style: TextStyle(color: Color(0xFF7dd3f7),fontWeight: FontWeight.bold),),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}
