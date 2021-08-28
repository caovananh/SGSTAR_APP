import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarMainScreen.dart';

class BusScreen extends StatefulWidget {
  const BusScreen({key}) : super(key: key);

  @override
  _BusScreenState createState() => _BusScreenState();
}

class _BusScreenState extends State<BusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMainScreen(),
      body: Center(
        child: Text('This is bus screen', style: TextStyle(fontSize: 50)),
      ),
    );
  }
}
