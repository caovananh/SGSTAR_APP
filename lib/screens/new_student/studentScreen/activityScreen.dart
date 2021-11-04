import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({key}) : super(key: key);
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  List<dynamic> listTeacher;

  String teacherPhoto;
  Future<void> _launched;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(5, (index) => null);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget(),
        body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton<String>(
                        items: <String>[
                          'Grade 1',
                          'Grade 2',
                          'Grade 3',
                          'Grade 4'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text("All Grades"),
                        onChanged: (_) {},
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      DropdownButton<String>(
                        items: <String>[
                          'Grade 1',
                          'Grade 2',
                          'Grade 3',
                          'Grade 4'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text("All Subjects"),
                        onChanged: (_) {},
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      IconButton(
                          onPressed: null,
                          icon: Icon(Icons.search))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, top: 15, bottom: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'My Recent Activities',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(
                      //   width: 170,
                      //   height: 300,
                      //   decoration: new BoxDecoration(
                      //
                      //       borderRadius:
                      //       new BorderRadius.circular(16.0),
                      //       color: Color(0xffe1f0ec)),
                      //   child: Column(
                      //     mainAxisAlignment:
                      //     MainAxisAlignment.center,
                      //     crossAxisAlignment:
                      //     CrossAxisAlignment.center,
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.only(
                      //             right: 10),
                      //         child: IconButton(
                      //             onPressed: null,
                      //             icon: Icon(
                      //               Icons.add_circle_outline,
                      //               size: 50,
                      //               color: Colors.blue,
                      //             )),
                      //       ),
                      //       SizedBox(
                      //         height: 20,
                      //       ),
                      //       Text(
                      //         'Create New Activity',
                      //         style: TextStyle(
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.bold,
                      //             color: Color(0xff13438f)),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 170,
                        height: 300,
                        decoration: new BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/card-thumb.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                            new BorderRadius.circular(16.0),
                            color: Color(0xffe1f0ec)),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.end,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10,right: 10),
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: new BorderRadius.only(topRight: Radius.circular(40.0),bottomRight: Radius.circular(40.0)),
                                    color: Color(0xFF7dd3f7)
                                  ),
                                  child: Text(
                                    'Browse the Community Library!',
                                    style: TextStyle(
                                      color: Colors.white,
                                        fontSize: 12,
                                        fontWeight:
                                        FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, top: 15, bottom: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'My Collections  (0)',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 250,
                          height: 50,
                          child: TextField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText:
                                'Create new collection to organize your....'),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: OutlinedButton(
                          onPressed: null,
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        5.0))),
                          ),
                          child: const Text("Create"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }

  Future<void> _openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
