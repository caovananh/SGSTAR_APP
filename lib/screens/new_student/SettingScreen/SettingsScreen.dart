import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('This is student screen', style: TextStyle(fontSize: 50)),
      ),
    );
  }
}
