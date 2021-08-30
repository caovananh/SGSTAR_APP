import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/BusScreen/BusWidgets/bus_history.dart';
import 'package:infixedu/screens/new_student/BusScreen/GuardianRegister.dart';
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff7cd3f7),
                ),
                child: TextButton(
                  child: Text('Register Bus'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GuardianRegister()));
                  },
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff7cd3f7),
                ),
                child: TextButton(
                  child: Text('History'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BusHistory()));
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
