import 'dart:convert';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/HomeScreen/Widgets/CommentContent.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NewsComment extends StatefulWidget {
  const NewsComment({key}) : super(key: key);

  @override
  _NewsCommentState createState() => _NewsCommentState();
}

class _NewsCommentState extends State<NewsComment> {
  showComment() {
    return Text("Comment");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment"),
        centerTitle: true,
        backgroundColor: Color(0xff7cd3f7),
      ),
      body: CommentContent(),
    );
  }
}
