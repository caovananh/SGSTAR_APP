import 'package:flutter/material.dart';
import 'dart:async';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/CardHeader.dart';
import 'package:infixedu/screens/new_student/studentScreen/CampDetails.dart';

class Camp extends StatefulWidget {
  const Camp({Key key}) : super(key: key);

  @override
  _CampState createState() => _CampState();
}

class _CampState extends State<Camp> {
  List<String> items = [
    'Summer Camp',
    'Winter Camp',
    'Club name',
    'Club name',
    'Club name',
    'Club name',
    'Club name'
  ];
  int _selected = null;
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
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      height: 130,
                      child: GestureDetector(
                        onTap: () {
                          _campDetails(index);
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
                                      items[index],
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: _selected == index
                                              ? Color(0xffffffff)
                                              : Color(0xff07509d)),
                                    ),
                                    Text('Unregisted',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: _selected == index
                                                ? Color(0xFF7dd3f7)
                                                : Colors.grey)),
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 60,
                                  backgroundImage: AssetImage(
                                      'assets/images/icons/sgsis_big_icon.png'),
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

  void _campDetails(int index) {
    setState(() {
      _selected = index;
    });
    Timer(Duration(milliseconds: 500), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CampDetails()),
      );
      setState(() {
        _selected = null;
      });
    });
  }
}
