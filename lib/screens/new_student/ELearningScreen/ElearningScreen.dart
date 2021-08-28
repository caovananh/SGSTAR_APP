import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarMainScreen.dart';

class ELearningScreen extends StatefulWidget {
  const ELearningScreen({key}) : super(key: key);

  @override
  _ELearningScreenState createState() => _ELearningScreenState();
}

class _ELearningScreenState extends State<ELearningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMainScreen(),
      body: Center(
        child: Text('This is Elearning screen', style: TextStyle(fontSize: 50)),
      ),
    );
  }
}
