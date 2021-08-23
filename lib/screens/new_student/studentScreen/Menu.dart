import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/CustomCollapse.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/WeekCalendarWidget.dart';

class Menu extends StatefulWidget {
  const Menu({key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget(),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFF7dd3f7),
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ]),
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                        child: Text('MENU',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff07509d)))),
                  ),
                ),
              ),
              WeekCalendarWidget(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: CusTomCollapse(
                              title: Text('HOT DISHES'),
                              content: Column(
                                children: [
                                  Text('hot soup'),
                                  Text('hot soup'),
                                  Text('hot soup'),
                                  Text('hot soup'),
                                  Text('hot soup'),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: CusTomCollapse(
                              title: Text('VEGETARIAN'),
                              content: Column(
                                children: [
                                  Text('hot soup'),
                                  Text('hot soup'),
                                  Text('hot soup'),
                                  Text('hot soup'),
                                  Text('hot soup'),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: CusTomCollapse(
                              title: Text('SALAD & VEGETABLES'),
                              content: Column(
                                children: [
                                  Text('hot soup'),
                                  Text('hot soup'),
                                  Text('hot soup'),
                                  Text('hot soup'),
                                  Text('hot soup'),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: CusTomCollapse(
                              title: Text('HAMS'),
                              content: Column(
                                children: [
                                  Text('hot soup'),
                                  Text('hot soup'),
                                  Text('hot soup'),
                                  Text('hot soup'),
                                  Text('hot soup'),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: CusTomCollapse(
                              title: Text('DESSERTS'),
                              content: Column(
                                children: [
                                  Text('hot soup'),
                                  Text('hot soup'),
                                  Text('hot soup'),
                                  Text('hot soup'),
                                  Text('hot soup'),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: CusTomCollapse(
                              title: Text('SNACK'),
                              content: Column(
                                children: [
                                  Text('hot soup'),
                                  Text('hot soup'),
                                  Text('hot soup'),
                                  Text('hot soup'),
                                  Text('hot soup'),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
