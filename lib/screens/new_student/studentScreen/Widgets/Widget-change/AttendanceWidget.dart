import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/studentScreen/Widgets/AttendanceDetail.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AttendanceList extends StatefulWidget {
  const AttendanceList({key}) : super(key: key);

  @override
  _AttendanceListState createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
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
            child: InkWell(
              onTap: (){
                pushNewScreen(
                  context,
                  screen: AttendanceDetail(),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              child: Card(
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
            ),
          );
        },
      ),
    );
  }
}