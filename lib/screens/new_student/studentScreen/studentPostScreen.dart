import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/studentScreen/CalendarAndEvent.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentPostScreen extends StatefulWidget {
  const StudentPostScreen({key}) : super(key: key);
  @override
  _StudentPostScreenState createState() => _StudentPostScreenState();
}

class _StudentPostScreenState extends State<StudentPostScreen> {
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
          child: GridView.count(
              childAspectRatio: (0.8),
              primary: true,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 20,
              mainAxisSpacing: 0,
              crossAxisCount: shortestSide < 600 ? 2 : 3,
              children: <Widget>[
                Container(
                    child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: const Color(0xFF7dd3f7),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          _navigate(1);
                        },
                        child: Icon(
                          Icons.camera_enhance,
                          color: Color(0xff13438f),
                          size: 120,
                        ),
                      ),
                    ),
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Photo'.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xff07509d)),
                        textAlign: TextAlign.center,
                      ),
                    )),
                  ],
                )),
                Container(
                    child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: const Color(0xFF7dd3f7),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          _navigate(1);
                        },
                        child: Icon(
                          Icons.edit,
                          color: Color(0xff13438f),
                          size: 120,
                        ),
                      ),
                    ),
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Drawing'.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xff07509d)),
                        textAlign: TextAlign.center,
                      ),
                    )),
                  ],
                )),
                Container(
                    child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: const Color(0xFF7dd3f7),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          _navigate(1);
                        },
                        child: Icon(
                          Icons.video_camera_back,
                          color: Color(0xff13438f),
                          size: 120,
                        ),
                      ),
                    ),
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Video'.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xff07509d)),
                        textAlign: TextAlign.center,
                      ),
                    )),
                  ],
                )),
                Container(
                    child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: const Color(0xFF7dd3f7),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          _navigate(1);
                        },
                        child: Icon(
                          Icons.cloud_upload_outlined,
                          color: Color(0xff13438f),
                          size: 120,
                        ),
                      ),
                    ),
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Upload'.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xff07509d)),
                        textAlign: TextAlign.center,
                      ),
                    )),
                  ],
                )),
                Container(
                    child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: const Color(0xFF7dd3f7),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          _navigate(1);
                        },
                        child: Icon(
                          Icons.notes,
                          color: Color(0xff13438f),
                          size: 120,
                        ),
                      ),
                    ),
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Note'.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xff07509d)),
                        textAlign: TextAlign.center,
                      ),
                    )),
                  ],
                )),
                Container(
                    child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: const Color(0xFF7dd3f7),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          _navigate(1);
                        },
                        child: Icon(
                          Icons.link,
                          color: Color(0xff13438f),
                          size: 120,
                        ),
                      ),
                    ),
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'link'.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xff07509d)),
                        textAlign: TextAlign.center,
                      ),
                    )),
                  ],
                )),
              ]),
        ));
  }

  void _navigate(int num) {
    switch (num) {
      case 1:
        pushNewScreen(
          context,
          screen: CalendarAndEvent(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );

        break;
      default:
        break;
    }
  }
}
