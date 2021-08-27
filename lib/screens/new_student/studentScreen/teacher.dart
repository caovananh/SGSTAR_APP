import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({key}) : super(key: key);
  @override
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: Container(
                width: double.infinity,
                child: new Text(
                  "teacher contact".toUpperCase(),
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
          ),
          SizedBox(height: 20),
          

          

        ],
      ),
    );
  }

 
}
