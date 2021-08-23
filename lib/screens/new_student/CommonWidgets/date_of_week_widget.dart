import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart';

class DateOfWeekWidget extends StatefulWidget {
  const DateOfWeekWidget({key}) : super(key: key);

  @override
  _DateOfWeekWidgetState createState() => _DateOfWeekWidgetState();
}

class _DateOfWeekWidgetState extends State<DateOfWeekWidget> {
  DateTime nextDay;
  DateTime prevDay;
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
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
            color: Colors.white),
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      getPrevWeekDates();
                    },
                    child: Text('<',
                        style:
                            TextStyle(color: Color(0xff07509d), fontSize: 24)),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {},
                    child: Text(
                      '${DateFormat("dd/MM/yyyy").format(monday_obj)} - ${DateFormat("dd/MM/yyyy").format(friday_obj)}'
                          .toUpperCase(),
                      style: TextStyle(
                          color: Color(0xff07509d),
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      getNextWeekDates();
                    },
                    child: Text('>',
                        style:
                            TextStyle(color: Color(0xff07509d), fontSize: 24)),
                  ),
                ],
              ),
            ),
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
      nextDay = now.subtract(Duration(days: currentDay - 1));
      prevDay = now.subtract(Duration(days: currentDay + 1));

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

      // print(sunday_dt);
      // print(monday_dt);
      // print(tuesday_dt);
      // print(wednesday_dt);
      // print(thursday_dt);
      // print(friday_dt);
      // print(saturday_dt);
    });
  }

  void changeSelectedDate(date) {
    setState(() {
      today = date;
      //selectedDate = date;
    });
    getThisWeekDates(today);
  }

  void getNextWeekDates() {}

  void getPrevWeekDates() {}

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
