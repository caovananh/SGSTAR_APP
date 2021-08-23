// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:infixedu/utils/CustomAppBarWidget.dart';
import 'package:infixedu/utils/FunctinsData.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/model/StudentAttendance.dart';

// ignore: must_be_immutable
class StudentAttendanceScreen extends StatefulWidget {
  var id;
  var token;

  StudentAttendanceScreen({this.id, this.token});

  @override
  _StudentAttendanceScreenState createState() =>
      _StudentAttendanceScreenState(id: id, token: token);
}

class _StudentAttendanceScreenState extends State<StudentAttendanceScreen> {
  var id;
  String token;
  Future<StudentAttendanceList> attendances;

  _StudentAttendanceScreenState({this.id, this.token});

  @override
  void initState() {
    Utils.getStringValue('token').then((value) {
      setState(() {
        token = value;
      });
      print('ATTENDANCE: $token');
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (id != null) {
      DateTime date = DateTime.now();
      attendances = getAllStudentAttendance(id, date.month, date.year, token);
    } else {
      Utils.getStringValue('id').then((value) {
        print(value);
        setState(() {
          id = int.parse(value);
          DateTime date = DateTime.now();
          attendances =
              getAllStudentAttendance(id, date.month, date.year, token);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _currentDate;
    var _markedDateMap;
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.indigo, //or set color with: Color(0xFF0000FF)
    ));

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
        appBar: CustomAppBarWidget(title: 'Attendance'),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Expanded(
              child: CalendarCarousel<Event>(
                  // height: MediaQuery.of(context).size.height * 0.5,
                  weekDayPadding: EdgeInsets.zero,
                  onDayPressed: (DateTime date, List<Event> events) {
                    this.setState(() => _currentDate = date);
                  },
                  onCalendarChanged: (DateTime date) {
                    setState(() {
                      attendances = getAllStudentAttendance(
                          widget.id, date.month, date.year, token);
                    });
                  },
                  weekendTextStyle: Theme.of(context).textTheme.headline6,
                  thisMonthDayBorderColor: Colors.grey,
                  daysTextStyle: Theme.of(context).textTheme.headline4,
                  showOnlyCurrentMonthDate: false,
                  headerTextStyle: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: ScreenUtil().setSp(15.0)),
                  weekdayTextStyle: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(
                          fontSize: ScreenUtil().setSp(15.0),
                          fontWeight: FontWeight.w500),
                  customDayBuilder: (
                    /// you can provide your own build function to make custom day containers
                    bool isSelectable,
                    int index,
                    bool isSelectedDay,
                    bool isToday,
                    bool isPrevMonthDay,
                    TextStyle textStyle,
                    bool isNextMonthDay,
                    bool isThisMonthDay,
                    DateTime day,
                  ) {
                    return FutureBuilder<StudentAttendanceList>(
                      future: attendances,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          //Utils.showToast(getAttendanceStatus(day.day, snapshot.data.attendances));

                          String status = getAttendanceStatus(
                              day.day, snapshot.data.attendances);

                          // print('DAY : ${day.day} STATUS : $status');
                          // print('STATUS : $status');
                          if (isThisMonthDay) {
                            if (isToday) {
                              return Center(
                                child: Container(
                                  width: ScreenUtil().setWidth(50),
                                  height: ScreenUtil().setHeight(45),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ]),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(day.day.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4
                                              .copyWith(
                                                color: Color(0xFF5F75EF),
                                                fontSize:
                                                    ScreenUtil().setSp(14.0),
                                              )),
                                      SizedBox(
                                        width: 1.5,
                                      ),
                                      Container(
                                        width: 8.0,
                                        height: 8.0,
                                        decoration: BoxDecoration(
                                          color: getStatusColor(status),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return Center(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        day.day.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            .copyWith(
                                              color: Color(0xFF727FC8),
                                              fontSize: ScreenUtil().setSp(14.0),
                                            ),
                                      ),
                                      SizedBox(
                                        width: 1.5,
                                      ),
                                      Container(
                                        width: 8.0,
                                        height: 8.0,
                                        decoration: BoxDecoration(
                                          color: getStatusColor(status),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          } else {
                            return Center(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(day.day.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            .copyWith(
                                            fontSize:
                                            ScreenUtil().setSp(14.0),
                                                color: isToday == true
                                                    ? Colors.white
                                                    : Colors.grey)),
                                  ],
                                ),
                              ),
                            );
                          }
                        } else {
                          return Center(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(day.day.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(color: Color(0xFF727FC8))),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                  weekFormat: false,
                  markedDatesMap: _markedDateMap,
                  selectedDateTime: _currentDate,
                  // daysHaveCircularBorder: true,
                  todayButtonColor: Colors.transparent,
                  todayBorderColor: Colors.transparent,
                  todayTextStyle: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.white)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                // physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  bottomDesign('Present', 'P', Colors.green),
                  bottomDesign('Absent', 'A', Colors.red),
                  bottomDesign('Late', 'L', Color(0xFFEDD200)),
                  bottomDesign('Halfday', 'H', Colors.purpleAccent),
                  bottomDesign('Holiday', 'F', Colors.deepPurpleAccent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomDesign(String title, String titleVal, Color color) {
    return FutureBuilder<StudentAttendanceList>(
        future: attendances,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    height: 20.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: color,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.black45, fontWeight: FontWeight.w500),
                  )),
                  Text(getStatusCount(titleVal, snapshot.data.attendances),
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }

  Future<StudentAttendanceList> getAllStudentAttendance(
      var id, int month, int year, String token) async {
    final response = await http.get(
        Uri.parse(InfixApi.getStudentAttendence(id, month, year)),
        headers: Utils.setHeader(token));

    debugPrint(InfixApi.getStudentAttendence(id, month, year));
    print(response.statusCode);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      print("JSON: $jsonData");

      return StudentAttendanceList.fromJson(jsonData['data']['attendances']);
    } else {
      throw Exception('Failed to load');
    }
  }

  String getAttendanceStatus(int date, List<StudentAttendance> attendances) {
    // print("ATTENTDENCE LEN : ${attendances.length}");
    return getStatus(0, attendances.length - 1, attendances, date);
  }

  String getStatus(
      int i, int j, List<StudentAttendance> attendances, int date) {
    String status;
    for (int a = i; a <= j; a++) {
      if (int.parse(AppFunction.getDay(attendances[a].date)) == date) {
        status = attendances[a].type;
        // print(AppFunction.getDay(attendances[a].date).substring(1));
        // print(date.toString());
        // break;
      }
    }
    return status;
  }

  getStatusColor(String status) {
    switch (status) {
      case 'P':
        return Colors.green;
        break;
      case 'A':
        return Colors.red;
        break;
      case 'L':
        return Color(0xFFEDD200);
        break;
      case 'H':
        return Colors.purpleAccent;
        break;
      case 'F':
        return Colors.deepPurple;
        break;
      default:
        return Colors.transparent;
        break;
    }
  }

  String getStatusCount(String titleVal, List<StudentAttendance> attendances) {
    int count = 0;
    for (int i = 0; i < attendances.length; i++) {
      if (attendances[i].type == titleVal) {
        count = count + 1;
      }
    }
    //debugPrint('count $count');
    return '$count days';
  }
}
