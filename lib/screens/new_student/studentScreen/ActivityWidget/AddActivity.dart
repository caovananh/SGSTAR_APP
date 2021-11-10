import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
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
  String fileName;
  File image;
  TextEditingController textController = TextEditingController();
  bool isSending = false;
  TextEditingController _controllerInput_1 = TextEditingController();
  TextEditingController _controllerInput_2 = TextEditingController();
  TextEditingController _controllerInput_3 = TextEditingController();
  var _image;

  void _choose() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding:
            EdgeInsets.only(top: 20.0, bottom: 30.0, left: 20.0, right: 20.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              25.0,
            ),
            border: Border.all(
              color: Color(0xFF9EDEFF),
              width: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 1.0, right: 1.0, top: 20.0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.075,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        color: Color(0xFF9EDEFF),
                        borderRadius: BorderRadius.circular(
                          45.0,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'CREATE ACTIVITIES',
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFF144385),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextField(
                    maxLines: null,
                    controller: textController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff7cd3f7), width: 2.0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff7cd3f7), width: 2.0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: Text(
                        'Title',
                        style: TextStyle(color: Color(0xFF9EDEFF)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(color: Color(0xff7cd3f7), width: 2)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2999),
                              builder: (BuildContext context, Widget child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                      primaryColor: const Color(0xff7cd3f7),
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
                                // String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate).toString();
                                // print(formattedDate);
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
                              labelStyle: TextStyle(color: Color(0xFF7dd3f7)),
                              hintText: "dd/mm/yy",
                              hintStyle: TextStyle(color: Color(0xFF7dd3f7))),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    maxLines: null,
                    controller: _controllerInput_2,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff7cd3f7), width: 2.0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff7cd3f7), width: 2.0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: Text('Description',
                          style: TextStyle(color: Color(0xFF9EDEFF))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    maxLines: null,
                    controller: _controllerInput_3,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff7cd3f7), width: 2.0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff7cd3f7), width: 2.0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: Text('Content',
                          style: TextStyle(color: Color(0xFF9EDEFF))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
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
                      child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 24),
                        maximumSize: Size.fromHeight(72),
                        shape: StadiumBorder(),
                      ),
                      onPressed: () async {

                        storeActivities();
                        if (isSending) return;
                        setState(() {
                          isSending = true;
                        });
                        await Future.delayed(Duration(seconds: 60));
                        print('ok');
                      },
                      child: isSending
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    )),
                                const SizedBox(
                                  width: 24,
                                ),
                                Text('Please Wait...')
                              ],
                            )
                          : Text('Save'),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String> storeActivities() async {
    final pref = await SharedPreferences.getInstance();
    _upload(_image);
    final response = await http.get(Uri.parse(InfixApi.storeActivities(textController.text,_controllerInput_1.text,_controllerInput_2.text,_controllerInput_3.text,fileName)));



    setState(() {
      textController.text='';
      _controllerInput_1.text = '';
      _controllerInput_2.text = '';
      _controllerInput_3.text = '';
    });
    Navigator.pop(context);
    return "Success!";
  }

  void _upload(file) async {
    fileName = file.split('/').last;

    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        file,
        filename: fileName,
      ),
    });

    Dio dio = new Dio();

    dio
        .post("https://sgstar.asia/api/upload-image-activities", data: data)
        .then((response) => print(response))
        .catchError((error) => print(error));
  }

  Future getImage() async {

    final picker = ImagePicker();

    // var _pickedFile = await picker.pickImage(
    //   source: ImageSource.gallery,
    //   imageQuality: 100, // <- Reduce Image quality
    // );
    var _pickedFile = await FilePicker.platform.pickFiles();

    setState(() {
      _image = _pickedFile.files.first.path;
    });
  }
}
