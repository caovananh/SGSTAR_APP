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
import 'package:infixedu/utils/model/ClassExam.dart';
import 'package:infixedu/utils/model/ClassExamSchedule.dart';
import 'package:infixedu/utils/widget/ClassExamResultRow.dart';

// ignore: must_be_immutable
class ClassExamResultScreen extends StatefulWidget {
  var id;

  ClassExamResultScreen({this.id});

  @override
  _ClassExamResultScreenState createState() => _ClassExamResultScreenState();
}

class _ClassExamResultScreenState extends State<ClassExamResultScreen> {
  Future<ClassExamResultList> results;
  var id;
  int code;
  var _selected;
  Future<ClassExamList> exams;
  String _token;


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
        id = widget.id != null ? widget.id : value;
        exams = getAllClassExam(id);
        exams.then((val) {
          _selected = val.exams.length !=0 ? val.exams[0].examName : '';
          code = val.exams.length !=0 ? val.exams[0].examId: 0;
          results = getAllClassExamResult(id, code);
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
        appBar: CustomAppBarWidget(title: 'Exam Result'),
        backgroundColor: Colors.white,
        body: FutureBuilder<ClassExamList>(
          future: exams,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if(snapshot.data.exams.length > 0){
                return Column(
                  children: <Widget>[
                    getDropdown(snapshot.data.exams),
                    SizedBox(
                      height: 15.0,
                    ),
                    Expanded(child: getExamResultList())
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

            results = getAllClassExamResult(id, code);

            getExamResultList();
          });
        },
        value: _selected,
      ),
    );
  }

  Future<ClassExamResultList> getAllClassExamResult(var id, int code) async {
    final response =
        await http.get(Uri.parse(InfixApi.getStudentClassExamResult(id, code)),headers: Utils.setHeader(_token.toString()));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return ClassExamResultList.fromJson(jsonData['data']['exam_result']);
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<ClassExamList> getAllClassExam(var id) async {
    final response = await http.get(Uri.parse(InfixApi.getStudentClassExamName(id)),headers: Utils.setHeader(_token.toString()));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      return ClassExamList.fromJson(jsonData['data']);
    } else {
      throw Exception('Failed to load');
    }
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

  Widget getExamResultList() {
    return FutureBuilder<ClassExamResultList>(
      future: results,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.results.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ClassExamResultRow(snapshot.data.results[index]);
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
}
