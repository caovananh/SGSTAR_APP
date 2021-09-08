import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({key}) : super(key: key);

  Size get preferredSize => const Size.fromHeight(60);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  String studentPhoto;
  String id;

  @override
  void initState() {
    getParentInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF7dd3f7),
      automaticallyImplyLeading: true,
      leading: Center(
        child: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.navigate_before_outlined,
            size: 40,
            color: Color(0xff07509d),
          ),
        ),
      ),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 8),
              child: CircleAvatar(
                radius: 17.0,
                backgroundImage: studentPhoto!=null?NetworkImage('https://sgstar.asia/'+ studentPhoto.toString()):AssetImage('assets/images/icons/student1.png'),
                backgroundColor: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_outlined,
                size: 40,
                color: Color(0xff07509d),
              ),
            ),
          ],
        )
      ],
    );
  }

  Future<String> getParentInfo() async {
    final pref = await SharedPreferences.getInstance();
    String remember = pref.get('StudentId');
    id = remember;
    final response =
        await http.get(Uri.parse(InfixApi.getStudentInfo(int.parse(id))));
    var jsonData = json.decode(response.body);
    //print(jsonData['data']['student_detail']);
    if (mounted) {
      setState(() {
        studentPhoto = jsonData['data']['student_detail']['student_photo'];
      });
    }
    //print(studentPhoto);
    return "Success!";
  }
}
