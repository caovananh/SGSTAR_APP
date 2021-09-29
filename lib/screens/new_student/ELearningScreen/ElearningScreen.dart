import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:http/http.dart' as http;
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/model/zoom_meeting.dart';
import 'package:infixedu/utils/widget/meeting_row.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ELearningScreen extends StatefulWidget {

  final uid;

  ELearningScreen({this.uid});

  @override
  _ELearningScreenState createState() => _ELearningScreenState();
}

class _ELearningScreenState extends State<ELearningScreen> {
  String _token;

  @override
  void initState() {
    Utils.getStringValue('token').then((value) {
      setState(() {
        _token = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
        appBar: AppBarWidget(),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xff7cd3f7)),
                child: Center(
                    child: Text('e-learning'.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xff13438f),
                            fontSize: 24,
                            fontWeight: FontWeight.w700))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 25),
              child: Text('all available course channels'.toUpperCase(),
                  style: TextStyle(
                      color: Color(0xff13438f),
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
            ),

            Expanded(
              child: FutureBuilder<ZoomMeetingList>(
                future: getAllMeeting(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.meetings.length < 1) {
                      return Center(child: Text("Not available",style: Theme.of(context).textTheme.subtitle1,));
                    }
                    return ListView.builder(
                      itemCount: snapshot.data.meetings.length,
                      itemBuilder: (context, index) {
                        return ZoomMeetingRow(
                            snapshot.data.meetings.elementAt(index));
                      },
                    );
                  } else {
                    return Center(child: CupertinoActivityIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<ZoomMeetingList> getAllMeeting() async {
    final pref = await SharedPreferences.getInstance();
    String classId = pref.get('class_id');
    String academicId = pref.get('academicId');
    final response = await http.get(Uri.parse(InfixApi.virtualClass(int.parse(classId), int.parse(academicId))));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData['data']['zoom']);

      return ZoomMeetingList.fromJson(jsonData['data']['zoom']);
    } else {
      throw Exception('Failed to load');
    }
  }
}
