import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/CustomCollapse.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/WeekCalendarWidget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;

import 'Widgets/MenuDetail.dart';


class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: Container(
        color: Colors.white,
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0,bottom: 20.0),
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
          Expanded(
            child: DefaultTabController(
                length: 5,
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    flexibleSpace: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0,right: 20.0),
                          child: TabBar(
                              isScrollable: true,
                              unselectedLabelColor: Colors.black26,
                              labelColor: Color(0xff07509d),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xFF7dd3f7)),
                              tabs: [
                                Tab(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Monday"),
                                  ),
                                ),
                                Tab(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Tuesday"),
                                  ),
                                ),
                                Tab(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Wednesday"),
                                  ),
                                ),
                                Tab(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Thursday"),
                                  ),
                                ),
                                Tab(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Friday"),
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(children: [
                    MenuDetail(day: 'monday'),
                    MenuDetail(day: 'tuesday'),
                    MenuDetail(day: 'wednesday'),
                    MenuDetail(day: 'thursday'),
                    MenuDetail(day: 'friday'),
                  ]),
                )
            ),
          )
        ]),
      ),
    );
  }
}
