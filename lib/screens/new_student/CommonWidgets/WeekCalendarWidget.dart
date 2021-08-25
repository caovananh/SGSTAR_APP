import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekCalendarWidget extends StatefulWidget {
  const WeekCalendarWidget({key}) : super(key: key);

  @override
  _WeekCalendarWidgetState createState() => _WeekCalendarWidgetState();
}

class _WeekCalendarWidgetState extends State<WeekCalendarWidget> {
  DateTime nextWeek;
  DateTime prevWeek;
  DateTime today = DateTime.now();

  DateTime sunday_obj;
  DateTime monday_obj;
  DateTime tuesday_obj;
  DateTime wednesday_obj;
  DateTime thursday_obj;
  DateTime friday_obj;
  DateTime saturday_obj;

  String sunday;
  String monday;
  String tuesday;
  String wednesday;
  String thursday;
  String friday;
  String saturday;

  String sunday_dt;
  String monday_dt;
  String tuesday_dt;
  String wednesday_dt;
  String thursday_dt;
  String friday_dt;
  String saturday_dt;

  String selectedMonth;
  String selectedYear;
  String selectedDate;

  void initState() {
    super.initState();
    getThisWeekDates(today);
  }

  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.round() - 40;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 2,
              color: const Color(0xFF7dd3f7),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ]),
        child: Column(
          children: <Widget>[
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                border: Border(
                  bottom:
                      BorderSide(width: 2.0, color: const Color(0xFF7dd3f7)),
                ),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          getPrevWeekDates();
                        },
                        child: Icon(
                          Icons.navigate_before_outlined,
                          color: Color(0xff07509d),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {},
                      child: Text(
                        '${selectedMonth} ${selectedYear}'.toUpperCase(),
                        style: TextStyle(color: Color(0xff07509d)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          getNextWeekDates();
                        },
                        child: Icon(
                          Icons.navigate_next,
                          color: Color(0xff07509d),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      InkWell(
                        // onTap: () {
                        //   changeSelectedDate(sunday_obj);
                        // },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(13),
                            ),
                            color: selectedDate == sunday_dt
                                ? Color(0xFF7dd3f7)
                                : Color(0xffffffff),
                          ),
                          width:
                              (MediaQuery.of(context).size.width - 20) * 0.13,
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Column(
                              children: [
                                Text('SUN',
                                    style: TextStyle(
                                        color: selectedDate == sunday_dt
                                            ? Color(0xffffffff)
                                            : Color(0xff07509d))),
                                Text('$sunday',
                                    style: TextStyle(
                                        color: selectedDate == sunday_dt
                                            ? Color(0xffffffff)
                                            : Color(0xff888888))),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeSelectedDate(monday_obj);
                        },
                        child: Container(
                          width:
                              (MediaQuery.of(context).size.width - 20) * 0.13,
                          color: selectedDate == monday_dt
                              ? Color(0xFF7dd3f7)
                              : Color(0xffffffff),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Column(
                              children: [
                                Text('MON',
                                    style: TextStyle(
                                        color: selectedDate == monday_dt
                                            ? Color(0xffffffff)
                                            : Color(0xff07509d))),
                                Text('$monday',
                                    style: TextStyle(
                                        color: selectedDate == monday_dt
                                            ? Color(0xffffffff)
                                            : Color(0xff888888))),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeSelectedDate(tuesday_obj);
                        },
                        child: Container(
                          width:
                              (MediaQuery.of(context).size.width - 20) * 0.13,
                          color: selectedDate == tuesday_dt
                              ? Color(0xFF7dd3f7)
                              : Color(0xffffffff),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Column(
                              children: [
                                Text('TUE',
                                    style: TextStyle(
                                        color: selectedDate == tuesday_dt
                                            ? Color(0xffffffff)
                                            : Color(0xff07509d))),
                                Text('$tuesday',
                                    style: TextStyle(
                                        color: selectedDate == tuesday_dt
                                            ? Color(0xffffffff)
                                            : Color(0xff888888))),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeSelectedDate(wednesday_obj);
                        },
                        child: Container(
                          width:
                              (MediaQuery.of(context).size.width - 20) * 0.13,
                          color: selectedDate == wednesday_dt
                              ? Color(0xFF7dd3f7)
                              : Color(0xffffffff),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Column(
                              children: [
                                Text('WED',
                                    style: TextStyle(
                                        color: selectedDate == wednesday_dt
                                            ? Color(0xffffffff)
                                            : Color(0xff07509d))),
                                Text('$wednesday',
                                    style: TextStyle(
                                        color: selectedDate == wednesday_dt
                                            ? Color(0xffffffff)
                                            : Color(0xff888888))),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeSelectedDate(thursday_obj);
                        },
                        child: Container(
                          width:
                              (MediaQuery.of(context).size.width - 20) * 0.13,
                          color: selectedDate == thursday_dt
                              ? Color(0xFF7dd3f7)
                              : Color(0xffffffff),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Column(
                              children: [
                                Text('THU',
                                    style: TextStyle(
                                        color: selectedDate == thursday_dt
                                            ? Color(0xffffffff)
                                            : Color(0xff07509d))),
                                Text('$thursday',
                                    style: TextStyle(
                                        color: selectedDate == thursday_dt
                                            ? Color(0xffffffff)
                                            : Color(0xff888888))),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeSelectedDate(friday_obj);
                        },
                        child: Container(
                          width:
                              (MediaQuery.of(context).size.width - 20) * 0.13,
                          color: selectedDate == friday_dt
                              ? Color(0xFF7dd3f7)
                              : Color(0xffffffff),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Column(
                              children: [
                                Text('FRI',
                                    style: TextStyle(
                                        color: selectedDate == friday_dt
                                            ? Color(0xffffffff)
                                            : Color(0xff07509d))),
                                Text('$friday',
                                    style: TextStyle(
                                        color: selectedDate == friday_dt
                                            ? Color(0xffffffff)
                                            : Color(0xff888888))),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeSelectedDate(saturday_obj);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(13),
                            ),
                            color: selectedDate == saturday_dt
                                ? Color(0xFF7dd3f7)
                                : Color(0xffffffff),
                          ),
                          width:
                              (MediaQuery.of(context).size.width - 20) * 0.13,
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Column(
                              children: [
                                Text('SAT',
                                    style: TextStyle(
                                        color: selectedDate == saturday_dt
                                            ? Color(0xffffffff)
                                            : Color(0xff07509d))),
                                Text('$saturday',
                                    style: TextStyle(
                                        color: selectedDate == saturday_dt
                                            ? Color(0xffffffff)
                                            : Color(0xff888888))),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void getThisWeekDates(today) {
    DateTime now = today;
    DateFormat formatter = DateFormat('dd');
    int currentDay = now.weekday;

    selectedDate = DateFormat('yyyy-MM-dd').format(today);

    setState(() {
      nextWeek = now.subtract(Duration(days: currentDay - 7));
      prevWeek = now.subtract(Duration(days: currentDay + 7));

      sunday_obj = now.subtract(Duration(days: currentDay));
      monday_obj = now.subtract(Duration(days: currentDay - 1));
      tuesday_obj = now.subtract(Duration(days: currentDay - 2));
      wednesday_obj = now.subtract(Duration(days: currentDay - 3));
      thursday_obj = now.subtract(Duration(days: currentDay - 4));
      friday_obj = now.subtract(Duration(days: currentDay - 5));
      saturday_obj = now.subtract(Duration(days: currentDay - 6));

      sunday_dt = DateFormat('yyyy-MM-dd').format(sunday_obj);
      monday_dt = DateFormat('yyyy-MM-dd').format(monday_obj);
      tuesday_dt = DateFormat('yyyy-MM-dd').format(tuesday_obj);
      wednesday_dt = DateFormat('yyyy-MM-dd').format(wednesday_obj);
      thursday_dt = DateFormat('yyyy-MM-dd').format(thursday_obj);
      friday_dt = DateFormat('yyyy-MM-dd').format(friday_obj);
      saturday_dt = DateFormat('yyyy-MM-dd').format(saturday_obj);

      sunday = formatter.format(sunday_obj);
      monday = formatter.format(monday_obj);
      tuesday = formatter.format(tuesday_obj);
      wednesday = formatter.format(wednesday_obj);
      thursday = formatter.format(thursday_obj);
      friday = formatter.format(friday_obj);
      saturday = formatter.format(saturday_obj);

      selectedMonth = getMonthString(
          DateFormat('MM').format(now.subtract(Duration(days: currentDay))));
      selectedYear =
          DateFormat('yyyy').format(now.subtract(Duration(days: currentDay)));
    });
  }

  void changeSelectedDate(date) {
    setState(() {
      today = date;
      //selectedDate = date;
    });
    getThisWeekDates(today);
  }

  void getNextWeekDates() {
    DateTime now = nextWeek;
    DateFormat formatter = DateFormat('dd');
    int currentDay = 0;

    selectedDate = DateFormat('yyyy-MM-dd').format(today);

    setState(() {
      nextWeek = now.subtract(Duration(days: currentDay - 7));
      prevWeek = now.subtract(Duration(days: currentDay + 7));

      sunday_obj = now.subtract(Duration(days: currentDay));
      monday_obj = now.subtract(Duration(days: currentDay - 1));
      tuesday_obj = now.subtract(Duration(days: currentDay - 2));
      wednesday_obj = now.subtract(Duration(days: currentDay - 3));
      thursday_obj = now.subtract(Duration(days: currentDay - 4));
      friday_obj = now.subtract(Duration(days: currentDay - 5));
      saturday_obj = now.subtract(Duration(days: currentDay - 6));

      sunday_dt = DateFormat('yyyy-MM-dd').format(sunday_obj);
      monday_dt = DateFormat('yyyy-MM-dd').format(monday_obj);
      tuesday_dt = DateFormat('yyyy-MM-dd').format(tuesday_obj);
      wednesday_dt = DateFormat('yyyy-MM-dd').format(wednesday_obj);
      thursday_dt = DateFormat('yyyy-MM-dd').format(thursday_obj);
      friday_dt = DateFormat('yyyy-MM-dd').format(friday_obj);
      saturday_dt = DateFormat('yyyy-MM-dd').format(saturday_obj);

      sunday = formatter.format(sunday_obj);
      monday = formatter.format(monday_obj);
      tuesday = formatter.format(tuesday_obj);
      wednesday = formatter.format(wednesday_obj);
      thursday = formatter.format(thursday_obj);
      friday = formatter.format(friday_obj);
      saturday = formatter.format(saturday_obj);

      selectedMonth = getMonthString(
          DateFormat('MM').format(now.subtract(Duration(days: currentDay))));
      selectedYear =
          DateFormat('yyyy').format(now.subtract(Duration(days: currentDay)));
    });
  }

  void getPrevWeekDates() {
    DateTime now = prevWeek;
    DateFormat formatter = DateFormat('dd');
    int currentDay = 0;

    selectedDate = DateFormat('yyyy-MM-dd').format(today);

    setState(() {
      nextWeek = now.subtract(Duration(days: currentDay - 7));
      prevWeek = now.subtract(Duration(days: currentDay + 7));

      sunday_obj = now.subtract(Duration(days: currentDay));
      monday_obj = now.subtract(Duration(days: currentDay - 1));
      tuesday_obj = now.subtract(Duration(days: currentDay - 2));
      wednesday_obj = now.subtract(Duration(days: currentDay - 3));
      thursday_obj = now.subtract(Duration(days: currentDay - 4));
      friday_obj = now.subtract(Duration(days: currentDay - 5));
      saturday_obj = now.subtract(Duration(days: currentDay - 6));

      sunday_dt = DateFormat('yyyy-MM-dd').format(sunday_obj);
      monday_dt = DateFormat('yyyy-MM-dd').format(monday_obj);
      tuesday_dt = DateFormat('yyyy-MM-dd').format(tuesday_obj);
      wednesday_dt = DateFormat('yyyy-MM-dd').format(wednesday_obj);
      thursday_dt = DateFormat('yyyy-MM-dd').format(thursday_obj);
      friday_dt = DateFormat('yyyy-MM-dd').format(friday_obj);
      saturday_dt = DateFormat('yyyy-MM-dd').format(saturday_obj);

      sunday = formatter.format(sunday_obj);
      monday = formatter.format(monday_obj);
      tuesday = formatter.format(tuesday_obj);
      wednesday = formatter.format(wednesday_obj);
      thursday = formatter.format(thursday_obj);
      friday = formatter.format(friday_obj);
      saturday = formatter.format(saturday_obj);

      selectedMonth = getMonthString(
          DateFormat('MM').format(now.subtract(Duration(days: currentDay))));
      selectedYear =
          DateFormat('yyyy').format(now.subtract(Duration(days: currentDay)));
    });
  }

  String getMonthString(month) {
    switch (month) {
      case '01':
        return ('JANUARY');
        break;
      case '02':
        return ('February');
        break;
      case '03':
        return ('March');
        break;
      case '04':
        return ('April');
        break;
      case '05':
        return ('May');
        break;
      case '06':
        return ('June');
        break;
      case '07':
        return ('July');
        break;
      case '08':
        return ('August');
        break;
      case '09':
        return ('September');
        break;
      case '10':
        return ('October');
        break;
      case '11':
        return ('November');
        break;
      case '12':
        return ('December');
        break;
      default:
        return ('NULL');
        break;
    }
  }
}
