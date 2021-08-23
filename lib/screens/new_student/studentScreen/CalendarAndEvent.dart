import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/WeekCalendarWidget.dart';
import 'package:infixedu/screens/new_student/studentScreen/Widgets/CalendarListView.dart';
import 'package:infixedu/screens/new_student/studentScreen/Widgets/EventListView.dart';
import 'package:infixedu/utils/Utils.dart';

class CalendarAndEvent extends StatefulWidget {
  const CalendarAndEvent({key}) : super(key: key);

  @override
  _CalendarAndEventState createState() => _CalendarAndEventState();
}

class _CalendarAndEventState extends State<CalendarAndEvent> {
  String name;
  int _selectedIndex = 0;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget(),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFF7dd3f7),
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ]),
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                        child: Text('CALENDAR & EVENT',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff07509d)))),
                  ),
                ),
              ),
              WeekCalendarWidget(),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: BottomNavigationBar(
                      selectedFontSize: 0,
                      selectedItemColor: Color(0xff07509d),
                      unselectedItemColor: Color(0xff888888),
                      type: BottomNavigationBarType.fixed,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage('assets/images/icons/calendar.png'),
                            size: 40,
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage('assets/images/icons/event.png'),
                            size: 40,
                          ),
                          label: '',
                        ),
                      ],
                      currentIndex: _selectedIndex,
                      onTap: _onItemTapped,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Container(
                        width: (MediaQuery.of(context).size.width - 40) / 2,
                        child: Text(
                          'CALENDAR',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: _selectedIndex == 0
                                  ? Color(0xff07509d)
                                  : Color(0xffffffff)),
                          textAlign: TextAlign.center,
                        )),
                    Container(
                        width: (MediaQuery.of(context).size.width - 40) / 2,
                        child: Text(
                          'EVENT',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: _selectedIndex == 1
                                  ? Color(0xff07509d)
                                  : Color(0xffffffff)),
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),
              ),
              Container(
                child: Expanded(child: viewlist(_selectedIndex)),
              )
            ],
          ),
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget viewlist(_selectedIndex) {
    switch (_selectedIndex) {
      case 0:
        return CalendarListView();
        break;
      case 1:
        return EventListView();
        break;
    }
  }
}
