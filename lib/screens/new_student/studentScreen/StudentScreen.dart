import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarMainScreen.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/FloatingButtons.dart';
import 'package:infixedu/screens/new_student/studentScreen/Absent.dart';
import 'package:infixedu/screens/new_student/studentScreen/CalendarAndEvent.dart';
import 'package:infixedu/screens/new_student/studentScreen/Camp.dart';
import 'package:infixedu/screens/new_student/studentScreen/ClinicScreen.dart';
import 'package:infixedu/screens/new_student/studentScreen/FeesAndPayment.dart';
import 'package:infixedu/screens/new_student/studentScreen/GradeBook.dart';
import 'package:infixedu/screens/new_student/studentScreen/Menu.dart';
import 'package:infixedu/screens/new_student/studentScreen/StudentInfoPage.dart';
import 'package:infixedu/screens/new_student/studentScreen/activityScreen.dart';
import 'package:infixedu/screens/new_student/studentScreen/gallery_screen.dart';
import 'package:infixedu/screens/new_student/studentScreen/leave.dart';
import 'package:infixedu/screens/new_student/studentScreen/note.dart';
import 'package:infixedu/screens/new_student/studentScreen/refunds_screen.dart';
import 'package:infixedu/screens/new_student/studentScreen/studentPostScreen.dart';
import 'package:infixedu/screens/new_student/studentScreen/subject.dart';
import 'package:infixedu/screens/new_student/studentScreen/survey.dart';
import 'package:infixedu/screens/new_student/studentScreen/teacher.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'DailyActivities.dart';
import 'Skill/skills.dart';
import 'StudentTransitions.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({key}) : super(key: key);

  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  int role;

  @override
  void initState() {
    role = this.getRole();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      appBar: AppBarMainScreen(),
      body: Container(
        color: Colors.white,
        child: role != 4
            ? Column(
                children: <Widget>[
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Container(
                      child: GridView.count(
                        childAspectRatio: (100 / 165),
                        primary: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 0,
                        crossAxisCount: shortestSide < 600 ? 4 : 6,
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
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/icons/calendar1.png')),
                                ),
                              ),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Calendar & Event'.toUpperCase(),
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
                                    _navigate(2);
                                  },
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/icons/daily_activities.png')),
                                ),
                              ),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Daily Activities'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xff07509d)),
                                  textAlign: TextAlign.center,
                                ),
                              ))
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
                                      _navigate(3);
                                    },
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/icons/grade_book.png')),
                                  )),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Grade book'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xff07509d)),
                                  textAlign: TextAlign.center,
                                ),
                              ))
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
                                    _navigate(4);
                                  },
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/icons/std_absent.png')),
                                ),
                              ),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Absent'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xff07509d)),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                            ],
                          )),
                          InkWell(
                            onTap: () {
                              _navigate(5);
                            },
                            child: Container(
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
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/icons/menu.png')),
                                ),
                                Flexible(
                                    child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    'Menu'.toUpperCase(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Color(0xff07509d)),
                                    textAlign: TextAlign.center,
                                  ),
                                ))
                              ],
                            )),
                          ),
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
                                    _navigate(6);
                                  },
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/icons/std_album.png')),
                                ),
                              ),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Photo Album'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xff07509d)),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                            ],
                          )),
                          Container(
                              child: Column(
                            children: <Widget>[
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 2,
                                      color: const Color(0xFF7dd3f7),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      _navigate(7);
                                    },
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/icons/clinic.png')),
                                  )),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Clinic'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xff07509d)),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                            ],
                          )),
                          Container(
                              child: Column(
                            children: <Widget>[
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 2,
                                      color: const Color(0xFF7dd3f7),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      _navigate(8);
                                    },
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/icons/camp.png')),
                                  )),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'camp'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xff07509d)),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                            ],
                          )),
                          Container(
                              child: Column(
                            children: <Widget>[
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 2,
                                      color: const Color(0xFF7dd3f7),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      _navigate(9);
                                    },
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/icons/leave.png')),
                                  )),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'leave'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xff07509d)),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                            ],
                          )),
                          Container(
                              child: Column(
                            children: <Widget>[
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 2,
                                      color: const Color(0xFF7dd3f7),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      _navigate(10);
                                    },
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/icons/note.png')),
                                  )),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'note'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xff07509d)),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                            ],
                          )),
                          Container(
                              child: Column(
                            children: <Widget>[
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 2,
                                      color: const Color(0xFF7dd3f7),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      _navigate(11);
                                    },
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/icons/subject.png')),
                                  )),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'subject'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xff07509d)),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                            ],
                          )),
                          Container(
                              child: Column(
                            children: <Widget>[
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 2,
                                      color: const Color(0xFF7dd3f7),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      _navigate(12);
                                    },
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/icons/teacher.png')),
                                  )),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'teacher'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xff07509d)),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Container(
                      child: GridView.count(
                        childAspectRatio: (100 / 50),
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        crossAxisCount: shortestSide < 600 ? 2 : 3,
                        children: <Widget>[
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffebf6ff),
                              ),
                              padding: const EdgeInsets.all(5),
                              child: InkWell(
                                onTap: () {
                                  _navigate_bottom(1);
                                },
                                child: Row(
                                  children: <Widget>[
                                    Image(
                                        image: AssetImage(
                                            'assets/images/icons/std_info.png')),
                                    Flexible(
                                        child: Text(
                                      'Student info'.toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Color(0xff07509d)),
                                    ))
                                  ],
                                ),
                              )),
                          InkWell(
                            onTap: () {
                              _navigate_bottom(2);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xffebf6ff),
                                ),
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  children: <Widget>[
                                    Image(
                                        image: AssetImage(
                                            'assets/images/icons/survey.png')),
                                    Flexible(
                                        child: Text(
                                      'survey'.toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Color(0xff07509d)),
                                    ))
                                  ],
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              _navigate_bottom(3);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xffebf6ff),
                                ),
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  children: <Widget>[
                                    Image(
                                        image: AssetImage(
                                            'assets/images/icons/fee.png')),
                                    Flexible(
                                        child: Text(
                                      'Fee & Payment'.toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Color(0xff07509d)),
                                    ))
                                  ],
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffebf6ff),
                            ),
                            padding: const EdgeInsets.all(5),
                            child: InkWell(
                                onTap: () {
                                  _navigate_bottom(4);
                                },
                                child: Row(
                                  children: <Widget>[
                                    Image(
                                        image: AssetImage(
                                            'assets/images/icons/REFUNDS.png')),
                                    Flexible(
                                        child: Text(
                                      'refund'.toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Color(0xff07509d)),
                                    ))
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: <Widget>[
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Container(
                      child: GridView.count(
                        childAspectRatio: (100 / 165),
                        primary: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 0,
                        crossAxisCount: shortestSide < 600 ? 4 : 6,
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
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/icons/calendar1.png')),
                                ),
                              ),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Calendar & Event'.toUpperCase(),
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
                                    _navigate(2);
                                  },
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/icons/daily_activities.png')),
                                ),
                              ),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Daily Activities'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xff07509d)),
                                  textAlign: TextAlign.center,
                                ),
                              ))
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
                                      _navigate(3);
                                    },
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/icons/grade_book.png')),
                                  )),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Grade book'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xff07509d)),
                                  textAlign: TextAlign.center,
                                ),
                              ))
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
                                    _navigate(4);
                                  },
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/icons/std_absent.png')),
                                ),
                              ),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Absent'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xff07509d)),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                            ],
                          )),
                          InkWell(
                            onTap: () {
                              _navigate(5);
                            },
                            child: Container(
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
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/icons/menu.png')),
                                ),
                                Flexible(
                                    child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    'Menu'.toUpperCase(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Color(0xff07509d)),
                                    textAlign: TextAlign.center,
                                  ),
                                ))
                              ],
                            )),
                          ),
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
                                    _navigate(6);
                                  },
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/icons/std_album.png')),
                                ),
                              ),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Photo Album'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xff07509d)),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                            ],
                          )),
                          Container(
                              child: Column(
                            children: <Widget>[
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 2,
                                      color: const Color(0xFF7dd3f7),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      _navigate(7);
                                    },
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/icons/clinic.png')),
                                  )),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Clinic'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xff07509d)),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                            ],
                          )),
                          Container(
                              child: Column(
                            children: <Widget>[
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 2,
                                      color: const Color(0xFF7dd3f7),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      _navigate(8);
                                    },
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/icons/camp.png')),
                                  )),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'camp'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xff07509d)),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                            ],
                          )),
                          Container(
                              child: Column(
                            children: <Widget>[
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 2,
                                      color: const Color(0xFF7dd3f7),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      _navigate(9);
                                    },
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/icons/leave.png')),
                                  )),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'leave'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xff07509d)),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                            ],
                          )),
                          Container(
                              child: Column(
                            children: <Widget>[
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 2,
                                      color: const Color(0xFF7dd3f7),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      _navigate(10);
                                    },
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/icons/note.png')),
                                  )),
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'note'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xff07509d)),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                            ],
                          )),
                          Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          width: 2,
                                          color: const Color(0xFF7dd3f7),
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          _navigate(13);
                                        },
                                        child: Image(
                                            image: AssetImage(
                                                'assets/images/academics.png')),
                                      )),
                                  Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          'Skill'.toUpperCase(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Color(0xff07509d)),
                                          textAlign: TextAlign.center,
                                        ),
                                      ))
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingButtons(),
    );
  }

  void _navigate_bottom(int num) {
    switch (num) {
      case 1:
        pushNewScreen(
          context,
          screen: StudentInfoPage(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );

        break;
      case 2:
        pushNewScreen(
          context,
          screen: SurveyScreen(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );

        break;
      case 3:
        pushNewScreen(
          context,
          screen: FeesAndPayment(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        break;
      case 4:
        pushNewScreen(
          context,
          screen: RefundPage(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        break;
      default:
        break;
    }
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
      case 2:
        pushNewScreen(
          context,
          screen: DailyActivities(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );

        break;
      case 3:
        pushNewScreen(
          context,
          screen: GradeBookScreen(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );

        break;
      case 5:
        pushNewScreen(
          context,
          screen: Menu(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );

        break;
      case 4:
        pushNewScreen(
          context,
          screen: AbsentScreen(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );

        break;
      case 6:
        pushNewScreen(
          context,
          screen: GalleryScreen(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );

        break;
      case 7:
        pushNewScreen(
          context,
          screen: ClinicPage(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );

        break;
      case 8:
        pushNewScreen(
          context,
          screen: Camp(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );

        break;
      case 9:
        pushNewScreen(
          context,
          screen: LeaveScreen(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );

        break;
      case 10:
        pushNewScreen(
          context,
          screen: NoteScreen(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );

        break;
      case 11:
        pushNewScreen(
          context,
          screen: SubjectScreen(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );

        break;
      case 12:
        pushNewScreen(
          context,
          screen: TeacherScreen(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        break;
      case 13:
        pushNewScreen(
          context,
          screen: ActivityScreen(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        break;
      case 14:
        pushNewScreen(
          context,
          screen: StudentPostScreen(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        break;
      case 13:
        pushNewScreen(
          context,
          screen: Skill(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );

        break;
      default:
        break;
    }
  }

  int getRole() {
    Utils.getStringValue('rule').then((value) {
      setState(() {
        role = int.parse(value);
      });
    });
    return role;
  }
}
