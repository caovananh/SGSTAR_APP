import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/month_calendar.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class BusHistory extends StatefulWidget {
  const BusHistory({key}) : super(key: key);

  @override
  _BusHistoryState createState() => _BusHistoryState();
}

class _BusHistoryState extends State<BusHistory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Scaffold(
        resizeToAvoidBottomInset: true,
        body: ListView(
          children: [
            Column(
            children: [
              MonthCalendarWidget()
            ],)
          ],
        )
      ),
    );
  }
}
