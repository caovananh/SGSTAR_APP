import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/ChatScreen/GuardianRegister.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarMainScreen.dart';

class BusScreen extends StatefulWidget {
  const BusScreen({key}) : super(key: key);

  @override
  _BusScreenState createState() => _BusScreenState();
}

class _BusScreenState extends State<BusScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMainScreen(),
      body: Center(
        child: FlatButton(
          child: Text('Register Bus'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => GuardianRegister()));
          },
          color: Color(0xFF9EDEFF),
        ),
      ),
    );
  }
}
