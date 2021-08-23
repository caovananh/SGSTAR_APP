import 'package:flutter/material.dart';

class ELearningScreen extends StatefulWidget {
  const ELearningScreen({key}) : super(key: key);

  @override
  _ELearningScreenState createState() => _ELearningScreenState();
}

class _ELearningScreenState extends State<ELearningScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('This is elearning screen', style: TextStyle(fontSize: 50)),
      ),
    );
  }
}
