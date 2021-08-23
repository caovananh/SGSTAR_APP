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
import 'package:infixedu/utils/model/ClassExamList.dart';
import 'package:infixedu/utils/model/ClassExamSchedule.dart';
import 'package:infixedu/utils/widget/ExamRow.dart';

// ignore: must_be_immutable
class ScheduleScreen extends StatefulWidget {
  var id;

  ScheduleScreen({this.id});

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState(id: id);
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  var _selected;

  Future<ClassExamList> exams;
  Future<classExamScheduleList> examlist;
  var id;
  int code;

  String _token;

  _ScheduleScreenState({this.id});

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
        exams = getAllClassExam(id);
        examlist = getAllClassExamSchedule(id, code);
        exams.then((val) {
          _selected = val.exams.length !=0 ? val.exams[0].examName: '';
          code = val.exams.length !=0  ? val.exams[0].examId: 0;
          examlist = getAllClassExamSchedule(id, code);
        });
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
        appBar: CustomAppBarWidget(title: 'Schedule'),
        backgroundColor: Colors.white,
        body: FutureBuilder<ClassExamList>(
          future: exams,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if(snapshot.data.exams.length >0){
                return Column(
                  children: <Widget>[
                    getDropdown(snapshot.data.exams),
                    SizedBox(
                      height: 15.0,
                    ),
                    Expanded(child: getExamList())
                  ],
                );
              }else{
                return Utils.noDataWidget();
              }
            } else {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget getDropdown(List<ClassExamName> exams) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: DropdownButton(
        elevation: 0,
        isExpanded: true,
        items: exams.map((item) {
          return DropdownMenuItem<String>(
            value: item.examName,
            child: Text(item.examName,style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(),),
          );
        }).toList(),
        style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 15.0),
        onChanged: (value) {
          setState(() {
            _selected = value;

            code = getExamCode(exams, value);

            debugPrint('User select $value');

            examlist = getAllClassExamSchedule(id, code);

            getExamList();
          });
        },
        value: _selected,
      ),
    );
  }

  Widget getExamList() {
    return FutureBuilder<classExamScheduleList>(
      future: examlist,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.exams.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return StudentExamRow(snapshot.data.exams[index]);
            },
          );
        } else {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }
      },
    );
  }

  int getExamCode(List<ClassExamName> exams, String title) {
    int code;

    for (ClassExamName exam in exams) {
      if (exam.examName == title) {
        code = exam.examId;
        break;
      }
    }
    return code;
  }

  Future<ClassExamList> getAllClassExam(var id) async {
    final response = await http.get(Uri.parse(InfixApi.getStudentClassExamName(id)),headers: Utils.setHeader(_token.toString()));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return ClassExamList.fromJson(jsonData['data']);
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<classExamScheduleList> getAllClassExamSchedule(
      var id, int code) async {
    print('ID: $id code $code');
    final response =
        await http.get(Uri.parse(InfixApi.getStudentClsExamShedule(id, code)),headers: Utils.setHeader(_token.toString()));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print('JSON: $jsonData');
      return classExamScheduleList.fromJson(jsonData['data']);
    } else {
      throw Exception('Failed to load');
    }
  }
}
