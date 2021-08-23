import 'package:flutter/material.dart';

class AttendanceList extends StatefulWidget {
  const AttendanceList({key}) : super(key: key);

  @override
  _AttendanceListState createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(15))),
          margin: EdgeInsets.all(10),
          color: Color(0xFFEBF6FF),
          shadowColor: Colors.blueGrey,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text(
                  "21/12/2021",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(15))),
          margin: EdgeInsets.all(10),
          color: Color(0xFFEBF6FF),
          shadowColor: Colors.blueGrey,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text(
                  "22/12/2021",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(15))),
          margin: EdgeInsets.all(10),
          color: Color(0xFFEBF6FF),
          shadowColor: Colors.blueGrey,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text(
                  "23/12/2021",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(15))),
          margin: EdgeInsets.all(10),
          color: Color(0xFFEBF6FF),
          shadowColor: Colors.blueGrey,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text(
                  "24/12/2021",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(15))),
          margin: EdgeInsets.all(10),
          color: Color(0xFFEBF6FF),
          shadowColor: Colors.blueGrey,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text(
                  "25/12/2021",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(15))),
          margin: EdgeInsets.all(10),
          color: Color(0xFFEBF6FF),
          shadowColor: Colors.blueGrey,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text(
                  "26/12/2021",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(15))),
          margin: EdgeInsets.all(10),
          color: Color(0xFFEBF6FF),
          shadowColor: Colors.blueGrey,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text(
                  "27/12/2021",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(15))),
          margin: EdgeInsets.all(10),
          color: Color(0xFFEBF6FF),
          shadowColor: Colors.blueGrey,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text(
                  "28/12/2021",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}