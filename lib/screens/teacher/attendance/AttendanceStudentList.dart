// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:infixedu/utils/CustomAppBarWidget.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/model/Attendance.dart';
import 'package:infixedu/utils/model/GlobalClass.dart';
import 'package:infixedu/utils/model/Student.dart';
import 'package:infixedu/utils/widget/ShimmerListWidget.dart';
import 'package:infixedu/utils/widget/StudentAttendanceRow.dart';

// ignore: must_be_immutable
class StudentListAttendance extends StatefulWidget {
  int classCode;
  int sectionCode;
  String url;
  String date;
  String token;

  StudentListAttendance(
      {this.classCode, this.sectionCode, this.url, this.date, this.token});

  @override
  _StudentListAttendanceState createState() => _StudentListAttendanceState(
      classCode: classCode,
      sectionCode: sectionCode,
      date: date,
      url: url,
      token: token);
}

class _StudentListAttendanceState extends State<StudentListAttendance> {
  int classCode;
  int sectionCode;
  String url;
  Future<StudentList> students;
  String date;
  List<String> absent = [];
  int totalStudent = 0;
  var function = GlobalDatae();
  GlobalKey _key = GlobalKey();
  String token;
  bool attendanceDone = false;

  Future<AttendanceList> newStudents;

  _StudentListAttendanceState(
      {this.classCode, this.sectionCode, this.url, this.date, this.token});

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('STUDENT ATTENDANCE ${widget.date}');
    setState(() {
      function.setZero();
      // students = getAllStudent();
      newStudents = getAttendance();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.indigo, //or set color with: Color(0xFF0000FF)
    ));

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
        key: _key,
        appBar: CustomAppBarWidget(
          title: 'Set Attendance',
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            attendanceDone == true ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Student attendance not done yet.",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: ScreenUtil().setSp(15)),
                  ),
                  Text(
                    "Select Present/Late/Absent/Halfday",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: ScreenUtil().setSp(14)),
                  ),
                ],
              ),
            ) : Container(),
            Expanded(
              child: FutureBuilder<AttendanceList>(
                future: newStudents,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    totalStudent = snapshot.data.attendances.length;
                    print(totalStudent);
                    return ListView.builder(
                      itemCount: snapshot.data.attendances.length,
                      itemBuilder: (context, index) {
                        return StudentAttendanceRow(
                          snapshot.data.attendances[index],
                          classCode,
                          sectionCode,
                          date,
                          token,
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ShimmerList(
                          itemCount: 1,
                          height: 80,
                        );
                      },
                    );
                  }
                },
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: 15.0, left: 10.0, right: 10.0, top: 10.0),
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 50.0,
                    decoration: Utils.gradientBtnDecoration,
                    child: Text(
                      "Set All Present",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.white, fontSize: ScreenUtil().setSp(14)),
                    ),
                  ),
                  onTap: () {
                    showAlertDialog(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<AttendanceList> getAttendance() async {
    // var response = await DefaultAssetBundle.of(context)
    //     .loadString("assets/images/response-attend.json");

    print(InfixApi.attendanceCheck(widget.date, classCode, sectionCode));
    final response = await http.get(Uri.parse(InfixApi.attendanceCheck(widget.date, classCode, sectionCode)),
        headers: Utils.setHeader(token));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      print(jsonData['message']);
      if(jsonData['message'] == 'Student attendance not done yet'){
        setState(() {
          attendanceDone = true;
        });
      }

      return AttendanceList.fromJson(jsonData['data']);
    } else {
      throw Exception('Failed to load');
    }
  }

  void sentNotificationToSection() async {
    final response = await http.get(Uri.parse(InfixApi.sentNotificationToSection(
        'Attendance', 'Attendance sunmitted', '$classCode', '$sectionCode')));
    if (response.statusCode == 200) {}
  }

  Future<StudentList> getAllStudent() async {
    final response =
        await http.get(Uri.parse(url), headers: Utils.setHeader(token.toString()));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return StudentList.fromJson(jsonData['data']['students']);
    } else {
      throw Exception('Failed to load');
    }
  }

  showAlertDialog(BuildContext context) {
    showDialog<void>(
      barrierDismissible: false,
      context: _key.currentContext,
      builder: (BuildContext context) {
        if (function.getAbsent() == 0) {
          setDefaultAttendance();
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Card(
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Colors.greenAccent.shade700,
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                              ),
                            ),
                            elevation: 18.0,
                            shape: CircleBorder(),
                            clipBehavior: Clip.antiAlias),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Success!',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Total student : $totalStudent',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Total Absent : ${function.getAbsent()}',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 10.0, left: 10.0, right: 10.0, top: 15.0),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.purple,
                            ),
                            child: Text(
                              "OK",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(
                                      color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                          onTap: () {
                            sentNotificationToSection();
                            Navigator.pop(_key.currentContext);
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void setDefaultAttendance() async {
    print(InfixApi.attendanceDefaultSent(date, '$classCode', '$sectionCode'));
    final response = await http.get(
        Uri.parse(InfixApi.attendanceDefaultSent(date, '$classCode', '$sectionCode')),
        headers: Utils.setHeader(token));
    if (response.statusCode == 200) {
      debugPrint('Attendance default successful');
    } else {
      throw Exception('Failed to load');
    }
  }
}
