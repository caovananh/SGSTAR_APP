import 'package:flutter/material.dart';

class CalendarListView extends StatefulWidget {
  const CalendarListView({key}) : super(key: key);

  @override
  _CalendarListViewState createState() => _CalendarListViewState();
}

class _CalendarListViewState extends State<CalendarListView> {
  final items = List<String>.generate(10, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
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
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                  ),
                  title: Text('One-line with leading widget'),
                  subtitle: Column(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('TIme: 25/12/2021 14:30')),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Teacher: '))
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
