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
import 'package:infixedu/utils/model/ONlineExamResult.dart';
import 'package:infixedu/utils/widget/OnlineExamResultRow.dart';

// ignore: must_be_immutable
class OnlineExamResultScreen extends StatefulWidget {
  var id;

  OnlineExamResultScreen({this.id});

  @override
  _OnlineExamResultScreenState createState() => _OnlineExamResultScreenState();
}

class _OnlineExamResultScreenState extends State<OnlineExamResultScreen> {
  Future<OnlineExamResultList> results;
  var id;
  dynamic code;
  var _selected;
  Future<OnlineExamNameList> exams;
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
        exams = getAllOnlineExam(id);
        exams.then((val) {
          _selected = val.names.length !=0 ? val.names[0].title: '';
          code = val.names.length !=0 ? val.names[0].id: 0;
          results = getAllOnlineExamResult(id, code);
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
        appBar: CustomAppBarWidget(title: 'Result'),
        backgroundColor: Colors.white,
        body: FutureBuilder<OnlineExamNameList>(
          future: exams,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if(snapshot.data.names.length >0){
                return Column(
                  children: <Widget>[
                    getDropdown(snapshot.data.names),
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
              return Center(child: CupertinoActivityIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget getDropdown(List<OnlineExamName> names) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: DropdownButton(
        elevation: 0,
        isExpanded: true,
        items: names.map((item) {
          return DropdownMenuItem<String>(
            value: item.title,
            child: Text(item.title,style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(fontWeight: FontWeight.w500),),
          );
        }).toList(),
        style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 15.0),
        onChanged: (value) {
          setState(() {
            _selected = value;

            code = getExamCode(names, value);

            debugPrint('User select $code');

            results = getAllOnlineExamResult(id, code);

            getExamResultList();
          });
        },
        value: _selected,
      ),
    );
  }

  Future<OnlineExamResultList> getAllOnlineExamResult(var id, dynamic code) async {
    final response =
        await http.get(Uri.parse(InfixApi.getStudentOnlineActiveExamResult(id, code)),headers: Utils.setHeader(_token.toString()));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return OnlineExamResultList.fromJson(jsonData['data']['exam_result']);
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<OnlineExamNameList> getAllOnlineExam(var id) async {
    final response =
        await http.get(Uri.parse(InfixApi.getStudentOnlineActiveExamName(id)),headers: Utils.setHeader(_token.toString()));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return OnlineExamNameList.fromJson(jsonData['data']);
    } else {
      throw Exception('Failed to load');
    }
  }

  dynamic getExamCode(List<OnlineExamName> names, String title) {
    dynamic code;
    for (OnlineExamName name in names) {
      if (name.title == title) {
        code = name.id;
        break;
      }
    }
    return code;
  }

  Widget getExamResultList() {
    return FutureBuilder<OnlineExamResultList>(
      future: results,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.results.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return OnlineExamResultRow(snapshot.data.results[index]);
            },
          );
        } else {
          return Center(child: CupertinoActivityIndicator());
        }
      },
    );
  }
}
