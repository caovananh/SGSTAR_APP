import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarMainScreen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMainScreen(),
      body: Container(
        child: Center(
          child: Text('This is student screen', style: TextStyle(fontSize: 50)),
        ),
      ),
    );
  }
}
