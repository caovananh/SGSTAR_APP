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
import 'package:infixedu/utils/model/ActiveOnlineExam.dart';
import 'package:infixedu/utils/widget/ActiveOnlineExam.dart';

// ignore: must_be_immutable
class ActiveOnlineExamScreen extends StatefulWidget {
  var id;

  ActiveOnlineExamScreen({this.id});

  @override
  _ActiveOnlineExamScreenState createState() =>
      _ActiveOnlineExamScreenState(id: id);
}

class _ActiveOnlineExamScreenState extends State<ActiveOnlineExamScreen> {
  Future<ActiveExamList> exams;
  var id;

  String _token;

  _ActiveOnlineExamScreenState({this.id});


  @override
  void initState() {
    Utils.getStringValue('token').then((value) {
      _token = value;
    });
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Utils.getStringValue('id').then((value) {
      setState(() {
        id = id != null ? id : value;
        exams = getAllActiveExam(id);
      });
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
        appBar: CustomAppBarWidget(title: 'Active Exam'),
        backgroundColor: Colors.white,
        body: FutureBuilder<ActiveExamList>(
          future: exams,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if(snapshot.data.activeExams.length > 0){
                return Column(
                  children: <Widget>[Expanded(child: getExamList())],
                );
              }else{
                return Utils.noDataWidget();
              }
            } else {
              return Center(child: CupertinoActivityIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget getExamList() {
    return FutureBuilder<ActiveExamList>(
      future: exams,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.activeExams.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ActiveOnlineExamRow(snapshot.data.activeExams[index]);
            },
          );
        } else {
          return Center(child: CupertinoActivityIndicator());
        }
      },
    );
  }

  Future<ActiveExamList> getAllActiveExam(var id) async {
    final response = await http.get(Uri.parse(InfixApi.getStudentOnlineActiveExam(id)),headers: Utils.setHeader(_token.toString()));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return ActiveExamList.fromJson(jsonData['data']['online_exams']);
    } else {
      throw Exception('Failed to load');
    }
  }
}
