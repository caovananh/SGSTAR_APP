import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

class StoreActivity extends StatefulWidget {
  const StoreActivity({key}) : super(key: key);

  @override
  _StoreActivityState createState() => _StoreActivityState();
}

class _StoreActivityState extends State<StoreActivity> {
  File image;
  TextEditingController textController = TextEditingController();
  bool isSending = false;
  TextEditingController _controllerInput_1 = TextEditingController();
  TextEditingController _controllerInput_2 = TextEditingController();
  TextEditingController _controllerInput_3 = TextEditingController();

  void _choose() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Fail to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body:
      // Padding(
      //   padding:
      //       EdgeInsets.only(top: 20.0, bottom: 30.0, left: 20.0, right: 20.0),
      //   child: Container(
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(
      //         25.0,
      //       ),
      //       border: Border.all(
      //         color: Color(0xFF9EDEFF),
      //         width: 1,
      //       ),
      //     ),
      //     child: Padding(
      //       padding: EdgeInsets.all(20.0),
      //       child: SingleChildScrollView(
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Padding(
      //               padding: EdgeInsets.only(left: 1.0, right: 1.0, top: 20.0),
      //               child: Container(
      //                 width: double.infinity,
      //                 height: MediaQuery.of(context).size.height * 0.075,
      //                 decoration: BoxDecoration(
      //                   boxShadow: [
      //                     BoxShadow(
      //                       color: Colors.grey.withOpacity(0.5),
      //                       spreadRadius: 1,
      //                       blurRadius: 2,
      //                       offset: Offset(0, 2), // changes position of shadow
      //                     ),
      //                   ],
      //                   color: Color(0xFF9EDEFF),
      //                   borderRadius: BorderRadius.circular(
      //                     45.0,
      //                   ),
      //                 ),
      //                 child: Center(
      //                   child: Text(
      //                     'CREATE ACTIVITIES',
      //                     style: TextStyle(
      //                         fontSize: 25,
      //                         color: Color(0xFF144385),
      //                         fontWeight: FontWeight.bold),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             SizedBox(
      //               height: 15.0,
      //             ),
      //             SizedBox(
      //               height: 15.0,
      //             ),
      //             TextField(
      //               maxLines: null,
      //               controller: textController,
      //               decoration: InputDecoration(
      //                 focusedBorder: OutlineInputBorder(
      //                   borderSide:
      //                       BorderSide(color: Color(0xff7cd3f7), width: 2.0),
      //                   borderRadius: BorderRadius.circular(20),
      //                 ),
      //                 enabledBorder: OutlineInputBorder(
      //                   borderSide:
      //                       BorderSide(color: Color(0xff7cd3f7), width: 2.0),
      //                   borderRadius: BorderRadius.circular(20),
      //                 ),
      //                 label: Text('Title',style: TextStyle(color: Color(0xFF9EDEFF)),),
      //               ),
      //             ),
      //             SizedBox(
      //               height: 15.0,
      //             ),
      //             Container(
      //               child: Container(
      //                 width: double.infinity,
      //                 height: 50,
      //                 decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(15),
      //                     border:
      //                         Border.all(color: Color(0xff7cd3f7), width: 2)),
      //                 child: Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: TextField(
      //                     onTap: () {
      //                       showDatePicker(
      //                         context: context,
      //                         initialDate: DateTime.now(),
      //                         firstDate: DateTime(2000),
      //                         lastDate: DateTime(2999),
      //                         builder: (BuildContext context, Widget child) {
      //                           return Theme(
      //                             data: ThemeData.light().copyWith(
      //                                 primaryColor: const Color(0xff7cd3f7),
      //                                 //Head background
      //                                 accentColor: const Color(
      //                                     0xff7cd3f7) //selection color
      //                                 //dialogBackgroundColor: Colors.white,//Background color
      //                                 ),
      //                             child: child,
      //                           );
      //                         },
      //                       ).then((selectedDate) {
      //                         if (selectedDate != null) {
      //                           // String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate).toString();
      //                           // print(formattedDate);
      //                           _controllerInput_1.text =
      //                               DateFormat('dd-MM-yyyy')
      //                                   .format(selectedDate)
      //                                   .toString();
      //                         }
      //                       });
      //                     },
      //                     readOnly: true,
      //                     controller: _controllerInput_1,
      //                     decoration: InputDecoration(
      //                         border: InputBorder.none,
      //                         labelStyle: TextStyle(color: Color(0xFF7dd3f7)),
      //                         hintText: "dd/mm/yy",
      //                         hintStyle: TextStyle(color: Color(0xFF7dd3f7))),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             SizedBox(
      //               height: 15,
      //             ),
      //             TextField(
      //               maxLines: null,
      //               controller: _controllerInput_2,
      //               decoration: InputDecoration(
      //                 focusedBorder: OutlineInputBorder(
      //                   borderSide:
      //                       BorderSide(color: Color(0xff7cd3f7), width: 2.0),
      //                   borderRadius: BorderRadius.circular(20),
      //                 ),
      //                 enabledBorder: OutlineInputBorder(
      //                   borderSide:
      //                       BorderSide(color: Color(0xff7cd3f7), width: 2.0),
      //                   borderRadius: BorderRadius.circular(20),
      //                 ),
      //                 label: Text('Description',style: TextStyle(color: Color(0xFF9EDEFF))),
      //               ),
      //             ),
      //             SizedBox(
      //               height: 15,
      //             ),
      //             TextField(
      //               maxLines: null,
      //               controller: _controllerInput_3,
      //               decoration: InputDecoration(
      //                 focusedBorder: OutlineInputBorder(
      //                   borderSide:
      //                       BorderSide(color: Color(0xff7cd3f7), width: 2.0),
      //                   borderRadius: BorderRadius.circular(20),
      //                 ),
      //                 enabledBorder: OutlineInputBorder(
      //                   borderSide:
      //                       BorderSide(color: Color(0xff7cd3f7), width: 2.0),
      //                   borderRadius: BorderRadius.circular(20),
      //                 ),
      //                 label: Text('Content',style: TextStyle(color: Color(0xFF9EDEFF))),
      //               ),
      //             ),
      //             SizedBox(
      //               height: 15,
      //             ),
      //             Center(
      //                 child: Container(
      //               width: double.infinity,
      //               child: ElevatedButton(
      //                 style: ElevatedButton.styleFrom(
      //                   textStyle: TextStyle(fontSize: 24),
      //                   maximumSize: Size.fromHeight(72),
      //                   shape: StadiumBorder(),
      //                 ),
      //                 onPressed: () async {
      //                   print('ok');
      //                   //storeStudentSkill();
      //                   if (isSending) return;
      //                   setState(() {
      //                     isSending = true;
      //                   });
      //                   await Future.delayed(Duration(seconds: 60));
      //                   print('ok');
      //                 },
      //                 child: isSending
      //                     ? Row(
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         children: [
      //                           SizedBox(
      //                               height: 20,
      //                               width: 20,
      //                               child: CircularProgressIndicator(
      //                                 color: Colors.white,
      //                               )),
      //                           const SizedBox(
      //                             width: 24,
      //                           ),
      //                           Text('Please Wait...')
      //                         ],
      //                       )
      //                     : Text('Save'),
      //               ),
      //             )
      //                 // OutlinedButton.icon(
      //                 //   onPressed: () {
      //                 //     storeStudentSkill();
      //                 //     print('ok');
      //                 //   },
      //                 //   label: Text('Save'),
      //                 //   icon: Icon(Icons.edit_sharp),
      //                 // ),
      //                 )
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),

      Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image != null
                  ? Image.file(
                image,
                width: 250,
                height: 100,
                fit: BoxFit.fill,
              )
                  : Image.asset(
                'assets/images/launcher.png',
                height: 160,
                width: 160,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    pickImage();
                    // _choose();
                  },
                  child: Text('Gallery picket')),
              ElevatedButton(
                  onPressed: () {
                    //pickImage();
                    print(image);
                    uploadImage();
                  },
                  child: Text('Upload'))
            ],
          ),
        ),
      ),
    );
  }

  // uploadFile() async {
  //   var postUri = Uri.parse(InfixApi.storeImage());
  //   var request = new http.MultipartRequest("POST", postUri);
  //   http.MultipartFile multipartFile =
  //   await http.MultipartFile.fromPath('image_file', image);
  //   // request.fields['user'] = 'blah';
  //   // request.files.add(new http.MultipartFile.fromBytes('file', await File.fromUri("<path/to/file>").readAsBytes(), contentType: new MediaType('image', 'jpeg')))
  //
  //   request.send().then((response) {
  //     if (response.statusCode == 200) print("Uploaded!");
  //   });
  // }

  Future<String> uploadImage() async {
    var postUri = Uri.parse(InfixApi.storeImage());
    var request = http.MultipartRequest('POST', Uri.parse(postUri.toString()));
    // request.files.add(await http.MultipartFile.fromPath('file', filepath.toString()));
    var multipartFile = http.MultipartFile.fromBytes(
      'file',
      (await rootBundle.load('assets/images/phonepe.jpg')).buffer.asUint8List(),
      filename: 'phonepe.jpg', // use the real name if available, or omit
      contentType: MediaType('image', 'jpg'),
    );

    request.files.add(multipartFile);
    var res = await request.send();
    //return res.reasonPhrase;
    print(request.files.toString());
  }
}
