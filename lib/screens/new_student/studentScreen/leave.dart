import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';

import 'package:image_picker/image_picker.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';

import 'package:infixedu/utils/apis/Apis.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({key}) : super(key: key);
  @override
  _LeaveScreenState createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  Future myFuture;
  String dropdownValue;
  List<dynamic> leaveTypeList;
  bool hasData = false;
  var _starttime;
  var _endtime;
  TextEditingController _controllerInput_1 = TextEditingController();
  TextEditingController _controllerInput_2 = TextEditingController();
  TextEditingController _controllerInput_3 = TextEditingController();

  void initState() {
    myFuture = this.getLeaveTypeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: FutureBuilder(
        future: myFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      child: new Text(
                        "leave".toUpperCase(),
                        style: new TextStyle(
                          color: Color(0Xff13438f),
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      decoration: new BoxDecoration(
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(30.0)),
                        color: Color(0xff7cd3f7),
                      ),
                      padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "information required to leave".toUpperCase(),
                      style: new TextStyle(
                        color: Color(0Xff13438f),
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Color(0xff7cd3f7), width: 2)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonHideUnderline(
                        child: new DropdownButton(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                              print(dropdownValue);
                            });
                          },
                          items: leaveTypeList.map((item) {
                            return DropdownMenuItem<String>(
                              value: item['id'].toString(),
                              child: Text(item['type']),
                            );
                          }).toList(),
                          hint: Text(
                            "Select leave type",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Color(0xff7cd3f7), width: 2)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2999),
                                    builder:
                                        (BuildContext context, Widget child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                            primaryColor:
                                                const Color(0xff7cd3f7),
                                            //Head background
                                            accentColor: const Color(
                                                0xff7cd3f7) //selection color
                                            //dialogBackgroundColor: Colors.white,//Background color
                                            ),
                                        child: child,
                                      );
                                    },
                                  ).then((selectedDate) {
                                    if (selectedDate != null) {
                                      _starttime =
                                          selectedDate.millisecondsSinceEpoch;

                                      _controllerInput_1.text =
                                          DateFormat('dd-MM-yyyy')
                                              .format(selectedDate)
                                              .toString();
                                    }
                                  });
                                },
                                readOnly: true,
                                controller: _controllerInput_1,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelStyle:
                                        TextStyle(color: Color(0xFF7dd3f7)),
                                    hintText: "Start date",
                                    hintStyle:
                                        TextStyle(color: Color(0xFF7dd3f7))),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Color(0xff7cd3f7), width: 2)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2999),
                                    builder:
                                        (BuildContext context, Widget child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                            primaryColor:
                                                const Color(0xff7cd3f7),
                                            //Head background
                                            accentColor: const Color(
                                                0xff7cd3f7) //selection color
                                            //dialogBackgroundColor: Colors.white,//Background color
                                            ),
                                        child: child,
                                      );
                                    },
                                  ).then((selectedDate) {
                                    if (selectedDate != null) {
                                      _endtime =
                                          selectedDate.millisecondsSinceEpoch;
                                      _controllerInput_2.text =
                                          DateFormat('dd-MM-yyyy')
                                              .format(selectedDate)
                                              .toString();
                                    }
                                  });
                                },
                                readOnly: true,
                                controller: _controllerInput_2,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelStyle:
                                        TextStyle(color: Color(0xFF7dd3f7)),
                                    hintText: "End date",
                                    hintStyle:
                                        TextStyle(color: Color(0xFF7dd3f7))),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 3),
                  child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side:
                              BorderSide(color: Color(0xff7cd3f7), width: 2.0)),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, left: 15),
                        child: TextField(
                          controller: _controllerInput_3,
                          style: TextStyle(color: Colors.black45),
                          maxLines: 8,
                          decoration: InputDecoration.collapsed(
                              hintText: "Reason",
                              hintStyle: TextStyle(
                                  fontSize: 14.0, color: Color(0xffd8d8d8))),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      side: BorderSide(
                        width: 2,
                        color: Color(0xff7cd3f7),
                      ),
                    ),
                    child: Text(
                      '+ Add File',
                      style: TextStyle(
                          color: Color(0xff13438f),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    onPressed: () async {
                      // var picked = await FilePicker.platform.pickFiles();
                      // print(picked.files.first.path);

                      // if (picked != null) {
                      getImage();
                      // }
                    },
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_starttime > _endtime) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                const AlertDialog(
                                    title: Text(
                                        'Start time must be early End time')));
                      } else {}
                      //storeLeave();
                    },
                    child: Text(
                      'SUBMIT',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffe4087e),
                      fixedSize: Size(140, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // <-- Radius
                      ),
                    ),
                  ),
                ),
              ],
            );
          else
            return Container(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }

  Future<String> getLeaveTypeList() async {
    final pref = await SharedPreferences.getInstance();
    String classId = pref.get('class_id');

    final response = await http.get(Uri.parse(InfixApi.schoolLeaveType(2)));
    Map<String, dynamic> map = json.decode(response.body);
    setState(() {
      leaveTypeList = map["data"]["leaveType"];
      hasData = true;
    });
    print(leaveTypeList);
    return "Success!";
  }

  Future<String> storeLeave() async {
    final pref = await SharedPreferences.getInstance();

    String classId = pref.get('class_id');
    String userId = pref.get('id');
    String schoolId = pref.get('schoolId');
    String academicId = pref.get('academicId');
    //print(int.parse(dropdownValue));
    final response = await http.get(Uri.parse(InfixApi.storeSchoolLeave(
        int.parse(userId),
        int.parse(dropdownValue),
        _controllerInput_1.text,
        _controllerInput_2.text,
        _controllerInput_3.text,
        int.parse(schoolId),
        int.parse(academicId))));

    setState(() {
      _controllerInput_1.text = '';
      _controllerInput_2.text = '';
      _controllerInput_3.text = '';
    });
    return "Success!";
  }

  void _upload(file) async {
    String fileName = file.split('/').last;

    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        file,
        filename: fileName,
      ),
    });

    Dio dio = new Dio();

    dio
        .post("https://sgstar.asia/api/upload-image", data: data)
        .then((response) => print(response))
        .catchError((error) => print(error));
  }

  Future getImage() async {
    var _image;
    final picker = ImagePicker();

    // var _pickedFile = await picker.pickImage(
    //   source: ImageSource.gallery,
    //   imageQuality: 100, // <- Reduce Image quality
    // );
    var _pickedFile = await FilePicker.platform.pickFiles();

    _image = _pickedFile.files.first.path;

    _upload(_image);
  }
}
