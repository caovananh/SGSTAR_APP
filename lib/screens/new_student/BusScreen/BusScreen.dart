import 'package:flutter/material.dart';

class BusScreen extends StatefulWidget {
  const BusScreen({key}) : super(key: key);

  @override
  _BusScreenState createState() => _BusScreenState();
}

class _BusScreenState extends State<BusScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('This is bus screen', style: TextStyle(fontSize: 50)),
      ),
    );
  }
}
