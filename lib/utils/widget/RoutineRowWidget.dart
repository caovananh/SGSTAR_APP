// Flutter imports:
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class  RoutineRowDesign extends StatelessWidget {

  String time;
  String subject;
  String room;


  RoutineRowDesign(this.time, this.subject, this.room);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top:5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child:  Text(time,style:Theme.of(context).textTheme.headline4),
            ),
            Expanded(
              child:  Text(subject,style:Theme.of(context).textTheme.headline4),
            ),
            Expanded(
              child:  Text(room,style:Theme.of(context).textTheme.headline4),
            ),
          ],
        ),
      ),
    );
  }
}
