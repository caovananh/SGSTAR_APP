
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:infixedu/screens/new_student/BusScreen/BusWidgets/bus_history_detail.dart';
import 'package:intl/intl.dart';

class MonthCalendarWidget extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MonthCalendarWidget> {
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();

  CalendarCarousel _calendarCarouselNoHeader;

  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2020, 2, 10): [
        new Event(
          date: new DateTime(2020, 2, 14),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2020, 2, 10),
          title: 'Event 2',
          icon: _eventIcon,
        ),
        new Event(
          date: new DateTime(2020, 2, 15),
          title: 'Event 3',
          icon: _eventIcon,
        ),
      ],
    },
  );

  @override
  void initState() {
    _markedDateMap.add(
        new DateTime(2020, 2, 25),
        new Event(
          date: new DateTime(2020, 2, 25),
          title: 'Event 5',
          icon: _eventIcon,
        ));

    _markedDateMap.add(
        new DateTime(2020, 2, 10),
        new Event(
          date: new DateTime(2020, 2, 10),
          title: 'Event 4',
          icon: _eventIcon,
        ));

    _markedDateMap.addAll(new DateTime(2019, 2, 11), [
      new Event(
        date: new DateTime(2019, 2, 11),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2019, 2, 11),
        title: 'Event 2',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2021, 30, 8),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Color(0xff7cd3f7),
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },

      weekdayTextStyle: TextStyle(color: Color(0xff13438f),fontWeight: FontWeight.bold),
      weekDayPadding: EdgeInsets.fromLTRB(0, 5, 0, 10),
      weekDayMargin: EdgeInsets.all(0),
      weekDayBackgroundColor: Color(0xffebf6ff),
      daysHaveCircularBorder: false,
      dayPadding: 0,
      leftButtonIcon: Text('<<',style: TextStyle(color: Color(0xff13438f),)),
      rightButtonIcon: Text('>>',style: TextStyle(color: Color(0xff13438f),)),
      selectedDayButtonColor: Color(0xff7cd3f7),
      selectedDayBorderColor: Color(0xff7cd3f7),
      dayButtonColor: Color(0xffebf6ff),
      
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.black,
      ),
      
      thisMonthDayBorderColor: Color(0xff7cd3f7),
      nextMonthDayBorderColor: Color(0xff7cd3f7),
      prevMonthDayBorderColor: Color(0xff7cd3f7),
      weekFormat: false,
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      width: double.infinity,
      height: 420.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      
        
      markedDateCustomTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      showHeader: true,
      dayCrossAxisAlignment: CrossAxisAlignment.center,
      
      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      headerText: ('${_currentMonth}'.toUpperCase()),
      headerTextStyle: TextStyle(color: Color(0xff13438f), fontSize: 24,fontWeight: FontWeight.bold),
      todayButtonColor: Color(0xff7cd3f7),
      selectedDayTextStyle: TextStyle(
        color: Colors.blueGrey,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        color: Color(0xffd6d6d6),
      ),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return new Padding(
         padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
         child : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //custom icon

              // Container(
              //   margin: EdgeInsets.only(
              //     top: 30.0,
              //     bottom: 16.0,
              //     left: 16.0,
              //     right: 16.0,
              //   ),
              //   child: new Row(
              //     children: <Widget>[
              //       Expanded(
              //           child: Text(
              //         _currentMonth,
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 24.0,
              //         ),
              //       )),
              //       TextButton(
              //         child: Text('PREV'),
              //         onPressed: () {
              //           setState(() {
              //             _targetDateTime = DateTime(
              //                 _targetDateTime.year, _targetDateTime.month - 1);
              //             _currentMonth =
              //                 DateFormat.yMMM().format(_targetDateTime);
              //           });
              //         },
              //       ),
              //       TextButton(
              //         child: Text('NEXT'),
              //         onPressed: () {
              //           setState(() {
              //             _targetDateTime = DateTime(
              //                 _targetDateTime.year, _targetDateTime.month + 1);
              //             _currentMonth =
              //                 DateFormat.yMMM().format(_targetDateTime);
              //           });
              //         },
              //       )
              //     ],
              //   ),
              // ),
              Column(
                children: [
                  Container(    
                    margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 20),
                    child: _calendarCarouselNoHeader,
                    
                  ),
                  Container(
                    width: 150,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xff7cd3f7),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => BusHistoryDetail()));
                      },
                      child: Text('done'.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                    ),
                  )
                ],
              ), //
            ],
          ),
        ));
  }
}
