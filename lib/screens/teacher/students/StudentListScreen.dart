// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:infixedu/utils/CustomAppBarWidget.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/model/Student.dart';
import 'package:infixedu/utils/widget/ShimmerListWidget.dart';
import 'package:infixedu/utils/widget/StudentSearchRow.dart';

// ignore: must_be_immutable
class StudentListScreen extends StatefulWidget {
  int classCode;
  int sectionCode;
  String name;
  String roll;
  String url;
  String status;
  String token;

  StudentListScreen(
      {this.classCode,
      this.sectionCode,
      this.name,
      this.roll,
      this.url,
      this.status,this.token});

  @override
  _StudentListScreenState createState() => _StudentListScreenState(
      classCode: classCode,
      sectionCode: sectionCode,
      name: name,
      roll: roll,
      url: url,
      status: status,token:token,);
}

class _StudentListScreenState extends State<StudentListScreen> {
  int classCode;
  int sectionCode;
  String name;
  String roll;
  String url;
  Future<StudentList> students;
  String status;
  String token;

  _StudentListScreenState(
      {this.classCode,
      this.sectionCode,
      this.name,
      this.roll,
      this.url,
      this.status,this.token});

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      students = getAllStudent();
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
        appBar: CustomAppBarWidget(title: 'Student List'),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: FutureBuilder<StudentList>(
          future: students,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print('STATUS::: $status');
              return ListView.builder(
                itemCount: snapshot.data.students.length,
                itemBuilder: (context, index) {
                  return StudentRow(
                    snapshot.data.students[index],
                    status: status,
                    token: token,
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
    );
  }

  Future<StudentList> getAllStudent() async {
    print(url);
    final response = await http.get(Uri.parse(url),headers: Utils.setHeader(token.toString()));


    print(response.body);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return StudentList.fromJson(jsonData['data']['students']);
    } else {
      throw Exception('Failed to load');
    }
  }
}
