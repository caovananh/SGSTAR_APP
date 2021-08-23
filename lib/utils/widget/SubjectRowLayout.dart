// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:infixedu/utils/model/Subject.dart';

// ignore: must_be_immutable
class SubjectRowLayout extends StatelessWidget {

  Subject subject;


  SubjectRowLayout(this.subject);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child:  Text(subject.subjectName,style:Theme.of(context).textTheme.headline6),
                ),
                Expanded(
                  child:  Text(subject.teacherName,style:Theme.of(context).textTheme.headline6),
                ),
                Expanded(
                  child:  Text(subject.subjectType == 'T' ? 'Theory' : 'Lab',style:Theme.of(context).textTheme.headline6),
                ),
              ],
            ),
        ),
        Container(
          height: 0.5,
          margin: EdgeInsets.only(top: 5.0,bottom: 5.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [Colors.purple, Colors.deepPurple]),
          ),
        ),
      ],
    );
  }
}
