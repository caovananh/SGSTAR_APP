// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:infixedu/utils/CustomAppBarWidget.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/model/Teacher.dart';
import 'package:infixedu/utils/server/About.dart';
import 'package:infixedu/utils/widget/Student_teacher_row_layout.dart';

// ignore: must_be_immutable
class StudentTeacher extends StatefulWidget {
  String id;
  String token;

  StudentTeacher({this.id,this.token});

  @override
  _StudentTeacherState createState() => _StudentTeacherState();
}

class _StudentTeacherState extends State<StudentTeacher>
    with SingleTickerProviderStateMixin {
  Future<TeacherList> teachers;
  int mId;
  int perm = -1;
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    Utils.getStringValue('id').then((value) {
      setState(() {
        mId = widget.id != null ? int.parse(widget.id) : int.parse(value);
        teachers = getAllTeacher(mId);
      });
    });
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.indigo,
    ));

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
        appBar: CustomAppBarWidget(title: 'Teacher'),
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.all(15.0),
          child: FutureBuilder<TeacherList>(
            future: teachers,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if(snapshot.data.teachers.length > 0){
                  About.phonePermission(widget.token).then((val) {
                    if (mounted) {
                      setState(() {
                        perm = val;
                      });
                    }
                  });
                  return perm != -1
                      ? ListView.separated(
                    shrinkWrap: true,
                    itemCount: snapshot.data.teachers.length,
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 1.0,
                      );
                    },
                    itemBuilder: (context, index) {
                      return StudentTeacherRowLayout(
                          snapshot.data.teachers[index], perm);
                    },
                  )
                      : Container();
                }else{
                  return Utils.noDataWidget();
                }
              } else {
                return Center(child: CupertinoActivityIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  Future<TeacherList> getAllTeacher(int id) async {
    final response = await http.get(Uri.parse(InfixApi.getStudentTeacherUrl(id)),headers: Utils.setHeader(widget.token.toString()));

    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return TeacherList.fromJson(jsonData['data']['teacher_list']);
    } else {
      throw Exception('Failed to load');
    }
  }
}
