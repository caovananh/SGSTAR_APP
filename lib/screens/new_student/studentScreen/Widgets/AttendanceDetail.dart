import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/CardHeader.dart';

class AttendanceDetail extends StatefulWidget {
  const AttendanceDetail({key}) : super(key: key);

  @override
  _AttendanceDetailState createState() => _AttendanceDetailState();
}

class _AttendanceDetailState extends State<AttendanceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        children: [
          CardHeader(child: Text('ATTENDANCE')),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.4,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                           ListTile(
                            title: Text(
                              "21/12/2021",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                             subtitle: Column(
                               children: [
                                 Align(
                                     alignment: Alignment.centerLeft,
                                     child: Text('21/12/2021')),
                               ],
                             ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )



        ],
      )
    );
  }
  
}