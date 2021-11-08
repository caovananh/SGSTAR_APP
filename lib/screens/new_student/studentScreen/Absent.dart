import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/date_of_week_widget.dart';
import 'package:infixedu/utils/Utils.dart';

class AbsentScreen extends StatefulWidget {
  const AbsentScreen({key}) : super(key: key);
  @override
  _AbsentScreenState createState() => _AbsentScreenState();
}

class _AbsentScreenState extends State<AbsentScreen> {
  bool _checkbox = false;
  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;
  String name;

  void initState() {
    super.initState();
    name = getName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: Container(
                width: double.infinity,
                child: new Text(
                  "absent".toUpperCase(),
                  style: new TextStyle(
                    color: Color(0Xff13438f),
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
                  color: Color(0xff7cd3f7),
                ),
                padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              ),
            ),
          ),
          DateOfWeekWidget(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 20),
                child: Text(
                  "list of courses".toUpperCase(),
                  style: new TextStyle(
                    color: Color(0Xff13438f),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    //                    <--- top side
                    color: Color(0xff7cd3f7),
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text('16/08/2021')),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Color(0xff7cd3f7),
                    ),
                    child: Checkbox(
                      value: _checkbox,
                      onChanged: (value) {
                        setState(() {
                          _checkbox = !_checkbox;
                        });
                      },
                    ),
                  ),
                  Text('Absent'),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Color(0xff7cd3f7),
                    ),
                    child: Checkbox(
                      value: _checkbox1,
                      onChanged: (value) {
                        setState(() {
                          _checkbox1 = !_checkbox1;
                        });
                      },
                    ),
                  ),
                  Text('Present'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    //                    <--- top side
                    color: Color(0xff7cd3f7),
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text('17/08/2021')),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Color(0xff7cd3f7),
                    ),
                    child: Checkbox(
                      value: _checkbox2,
                      onChanged: (value) {
                        setState(() {
                          _checkbox2 = !_checkbox2;
                        });
                      },
                    ),
                  ),
                  Text('Absent'),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Color(0xff7cd3f7),
                    ),
                    child: Checkbox(
                      value: _checkbox3,
                      onChanged: (value) {
                        setState(() {
                          _checkbox3 = !_checkbox3;
                        });
                      },
                    ),
                  ),
                  Text('Present'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 3),
            child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Color(0xff7cd3f7), width: 2.0)),
                child: Padding(
                  padding: EdgeInsets.only(top: 10, left: 15),
                  child: TextField(
                    style: TextStyle(color: Colors.black45),
                    maxLines: 8,
                    decoration: InputDecoration.collapsed(
                        hintText: "Reason Absent ...",
                        hintStyle: TextStyle(
                            fontSize: 14.0, color: Color(0xffd8d8d8))),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 25, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Attach file',
                    style: TextStyle(color: Color(0xff13438f), fontSize: 16)),
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'SUBMIT',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xffe4087e),
                fixedSize: Size(140, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // <-- Radius
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getName() {
    Utils.getStringValue('full_name').then((value) {
      setState(() {
        name = value;
      });
    });
    return name;
  }
}
