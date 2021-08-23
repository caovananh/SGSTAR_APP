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
import 'package:infixedu/utils/model/StudentHomework.dart';
import 'package:infixedu/utils/widget/Homework_row.dart';

// ignore: must_be_immutable
class StudentHomework extends StatefulWidget {
  String id;

  StudentHomework({this.id});

  @override
  _StudentHomeworkState createState() => _StudentHomeworkState();
}

class _StudentHomeworkState extends State<StudentHomework> {
  Future<HomeworkList> homeworks;
  String _token;

  @override
  void initState() {
    Utils.getStringValue('token').then((value) {
      _token = value;
    });
    Utils.getStringValue('id').then((value) {
      setState(() {
        homeworks = fetchHomework(
            widget.id != null ? int.parse(widget.id) : int.parse(value));
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
        appBar: CustomAppBarWidget(title: 'Homework'),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          child: FutureBuilder<HomeworkList>(
            future: homeworks,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot != null) {
                return ListView.builder(
                  itemCount: snapshot.data.homeworks.length,
                  itemBuilder: (context, index) {
                    return StudentHomeworkRow(snapshot.data.homeworks[index],'student');
                  },
                );
              } else {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<HomeworkList> fetchHomework(int id) async {
    final response = await http.get(Uri.parse(InfixApi.getStudenthomeWorksUrl(id)),headers: Utils.setHeader(_token.toString()));

    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      // debugPrint(jsonData);

      return HomeworkList.fromJson(jsonData['data']);
    } else {
      throw Exception('failed to load');
    }
  }
}
