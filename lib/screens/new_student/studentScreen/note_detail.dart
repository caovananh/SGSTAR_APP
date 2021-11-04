import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NoteDetail extends StatefulWidget { final int id;
  const NoteDetail({key, this.id}) : super(key: key);
  @override
  _NoteDetailState createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  String content;
  String message;
  bool hasData=false;
  void initState() {
    this.getStudentSkill();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: hasData!=false ? ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              child: new Text(
                "notification".toUpperCase(),
                style: new TextStyle(
                  color: Color(0Xff13438f),
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
                color: Color(0xff7cd3f7),
              ),
              padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Text(message!=null?message.toUpperCase():'',
              style: TextStyle(color: Color(0xff13438f),fontSize: 18,fontWeight: FontWeight.w700),),
          ),

          Padding(
            padding: EdgeInsets.only(left: 20,right: 20,top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(content!=null?content:''),
                SizedBox(height: 10,)
              ],
            ),
          ),

        ],
      ) : Center( child: Text('There no detail to show'.toUpperCase()),),
    );
  }

  Future<void> getStudentSkill() async {
    final pref = await SharedPreferences.getInstance();
    int id = this.widget.id;
    final response = await http.get(Uri.parse(InfixApi.getNotificationDetail(this.widget.id)));
    var jsonData = json.decode(response.body);
    print(jsonData);
    if (mounted) {
      setState(() {
        content = jsonData['data']['content']['content'];
        message = jsonData['data']['content']['message'];
        hasData = true;
      });
    }
  }
}
