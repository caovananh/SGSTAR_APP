import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/CardHeader.dart';
import 'package:infixedu/screens/new_student/studentScreen/CampDetails.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Camp extends StatefulWidget {
  const Camp({Key key}) : super(key: key);

  @override
  _CampState createState() => _CampState();
}

class _CampState extends State<Camp> {
  List<dynamic> campList;
  bool hasData = false;
  List<String> items = [
    'Summer Camp',
    'Winter Camp',
  ];
  int _selected = null;
  @override
  void initState() {
    getCampList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: Container(
        child: Column(
          children: [
            CardHeader(child: Text('CAMP')),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: campList == null ? 0 : campList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      height: 130,
                      child: GestureDetector(
                        onTap: () {
                          _campDetails(index,campList[index]['id']);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: _selected == index
                              ? Color(0xff07509d)
                              : Color(0xffebf6ff),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      campList[index]['news_title'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: _selected == index
                                              ? Color(0xffffffff)
                                              : Color(0xff07509d)),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(campList[index]['description'],
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: _selected == index
                                                ? Color(0xFF7dd3f7)
                                                : Colors.grey)),
                                    SizedBox(height: 20,),
                                    Text(campList[index]['publish_date'],
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: _selected == index
                                                ? Color(0xFF7dd3f7)
                                                : Colors.grey[800])),
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage:campList!=null? NetworkImage("https://sgstar.asia/" + campList[index]["image"])
                                      : AssetImage('assets/images/icons/sgsis_big_icon.png'),

                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  void _campDetails(int index,int id) {
    setState(() {
      _selected = index;
    });
    Timer(Duration(milliseconds: 500), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CampDetails(id)),
      );
      setState(() {
        _selected = null;
      });
    });
  }
  Future<String> getCampList() async {
    final response = await http.get(Uri.parse(InfixApi.schoolCamp()));
    Map<String, dynamic> map = json.decode(response.body);
    setState(() {
      campList = map["data"]["News"];
      hasData = true;
    });
    return "Success!";
  }
}
