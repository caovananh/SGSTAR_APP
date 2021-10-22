import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:infixedu/screens/login/login_new.dart';
import 'package:infixedu/screens/new_student/ChatScreen/ChatScreen.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/Logout.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class FloatingChat extends StatefulWidget {
  const FloatingChat({Key key}) : super(key: key);

  @override
  _FloatingChatState createState() => _FloatingChatState();
}

class _FloatingChatState extends State<FloatingChat> {
  bool hasData = false;
  List<dynamic> studentList;
  String name;
  String _chosenValue;
  List<String> student_List = [];
  TextEditingController _controllerInput = TextEditingController();
  List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  String _selectedLocation; // Option 2
  @override
  void initState() {
    this.getStudentList();
    super.initState();
  }

  Widget build(BuildContext context) {

  }


}
