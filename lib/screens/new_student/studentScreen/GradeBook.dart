import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/date_of_week_widget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/week_new_calendar.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/year_calendar.dart';
import 'package:infixedu/utils/Utils.dart';

class GradeBookScreen extends StatefulWidget {
  const GradeBookScreen({key}) : super(key: key);
  @override
  _GradeBookScreenState createState() => _GradeBookScreenState();
}

class _GradeBookScreenState extends State<GradeBookScreen>
    with SingleTickerProviderStateMixin {
  bool _checkbox = false;
  String name;
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(_handleTabSelection);
    super.initState();
    name = getName();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Center(
              child: Container(
                width: double.infinity,
                child: new Text(
                  "GRADE BOOK",
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
            Container(
              padding: EdgeInsets.only(top: 10),
              child: DefaultTabController(
                  length: 3,
                  child: TabBar(
                    labelPadding: EdgeInsets.all(0),
                    controller: _tabController,
                    indicatorColor: Color(0xff7cd3f7),
                    tabs: [
                      Container(
                        width: 120,
                        child: Tab(
                          child: Text(
                            "WEEKLY SCORES",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff13438f),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Container(
                        width: 120,
                        child: Tab(
                          child: Text(
                            "SUBJECT SCORES",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff13438f),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Container(
                        width: 120,
                        child: Tab(
                          child: Text(
                            "PROGRESS REPORTS",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff13438f),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [
                ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Week2CalendarWidget(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(
                        color: Color(0xffebf6ff),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                            contentPadding: EdgeInsets.only(left: 0.0),
                            isThreeLine: true,
                            leading: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF7dd3f7),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                ),
                              ),
                              width: 35,
                              height: 30,
                              child: Center(
                                  child: Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Subject",
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    '25/12/2021',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                            subtitle: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 30),
                                          child: Text(
                                            'Score:',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        Text(
                                          '200-400',
                                          style: TextStyle(
                                              color: Color(0xff7cd3f7),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(
                        color: Color(0xffebf6ff),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                            contentPadding: EdgeInsets.only(left: 0.0),
                            isThreeLine: true,
                            leading: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF7dd3f7),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                ),
                              ),
                              width: 35,
                              height: 30,
                              child: Center(
                                  child: Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Subject",
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    '25/12/2021',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                            subtitle: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 30),
                                          child: Text(
                                            'Score:',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        Text(
                                          '200-400',
                                          style: TextStyle(
                                              color: Color(0xff7cd3f7),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(
                        color: Color(0xffebf6ff),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                            contentPadding: EdgeInsets.only(left: 0.0),
                            isThreeLine: true,
                            leading: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF7dd3f7),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                ),
                              ),
                              width: 35,
                              height: 30,
                              child: Center(
                                  child: Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Subject",
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    '25/12/2021',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                            subtitle: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 30),
                                          child: Text(
                                            'Score:',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        Text(
                                          '200-400',
                                          style: TextStyle(
                                              color: Color(0xff7cd3f7),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(
                        color: Color(0xffebf6ff),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                            contentPadding: EdgeInsets.only(left: 0.0),
                            isThreeLine: true,
                            leading: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF7dd3f7),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                ),
                              ),
                              width: 35,
                              height: 30,
                              child: Center(
                                  child: Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Subject",
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    '25/12/2021',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                            subtitle: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 30),
                                          child: Text(
                                            'Score:',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        Text(
                                          '200-400',
                                          style: TextStyle(
                                              color: Color(0xff7cd3f7),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                ListView(
                  children: [Text("Second Screen")],
                ),
                ListView(
                  children: [
                    YearCalendarWidget(),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffebf6ff),
                          boxShadow: [
                            BoxShadow(color: Colors.grey),
                          ],
                        ),
                        child: GridView.count(
                          childAspectRatio: 3 / 2,
                          primary: false,
                          padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 40,
                          crossAxisCount: 2,
                          children: <Widget>[
                            Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xff7cd3f7), width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: const Text(
                                  "TERM 1",
                                  style: TextStyle(
                                      color: Color(0xff7cd3f7),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20),
                                ))),
                            Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xff7cd3f7), width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: const Text(
                                  "TERM 2",
                                  style: TextStyle(
                                      color: Color(0xff7cd3f7),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20),
                                ))),
                            Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xff7cd3f7), width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: const Text(
                                  "TERM 3",
                                  style: TextStyle(
                                      color: Color(0xff7cd3f7),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20),
                                ))),
                            Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xff7cd3f7), width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: const Text(
                                  "TERM 4",
                                  style: TextStyle(
                                      color: Color(0xff7cd3f7),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20),
                                ))),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ))
          ],
        ),
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
