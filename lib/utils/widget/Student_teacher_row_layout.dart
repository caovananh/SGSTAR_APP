// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Package imports:
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:infixedu/utils/model/Teacher.dart';

// ignore: must_be_immutable
class StudentTeacherRowLayout extends StatefulWidget {
  Teacher teacher;
  int per;

  StudentTeacherRowLayout(this.teacher, this.per);

  @override
  _StudentTeacherRowLayoutState createState() =>
      _StudentTeacherRowLayoutState();
}

class _StudentTeacherRowLayoutState extends State<StudentTeacherRowLayout> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: [
            Container(
                width: ScreenUtil().setWidth(16.0),
                child: Image.asset(
                  'assets/images/teacher.png',
                  scale: 2.0,
                )),
            SizedBox(
              width: 2,
            ),
            Text(widget.teacher.teacherName,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontSize: ScreenUtil().setSp(18.0), fontWeight: FontWeight.w500)),
          ],
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                await canLaunch('mailto:${widget.teacher.teacherEmail}')
                    ? await launch('mailto:${widget.teacher.teacherEmail}')
                    : throw 'Could not launch ${widget.teacher.teacherEmail}';
              },
              child: SizedBox(
                height: 30,
                child: Row(
                  children: [
                    Icon(
                      Icons.mail_outline,
                      color: Colors.indigo,
                      size: ScreenUtil().setSp(18.0),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(widget.teacher.teacherEmail,
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontSize: ScreenUtil().setSp(14.0))),
                  ],
                ),
              ),
            ),
            widget.teacher.teacherPhone == null ||
                    widget.teacher.teacherPhone == ''
                ? Container()
                : InkWell(
                    onTap: () async {
                      await canLaunch('tel:${widget.teacher.teacherPhone}')
                          ? await launch('tel:${widget.teacher.teacherPhone}')
                          : throw 'Could not launch ${widget.teacher.teacherPhone}';
                    },
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.indigo,
                            size: ScreenUtil().setSp(18.0),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                              widget.per == 1
                                  ? widget.teacher.teacherPhone
                                  : 'not available',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(fontSize: ScreenUtil().setSp(14.0))),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );

    // return Column(
    //   children: <Widget>[
    //     Container(
    //       child: Row(
    //         children: <Widget>[
    //           Expanded(
    //             child: Text(teacher.teacherName,
    //                 style: Theme.of(context)
    //                     .textTheme
    //                     .headline4
    //                     .copyWith(fontSize: 10.0)),
    //           ),
    //           Expanded(
    //             child: Text(teacher.teacherEmail,
    //                 style: Theme.of(context)
    //                     .textTheme
    //                     .headline4
    //                     .copyWith(fontSize: 10.0)),
    //           ),
    //           Expanded(
    //             child: Text(per == 1 ? teacher.teacherPhone : 'not available',
    //                 style: Theme.of(context)
    //                     .textTheme
    //                     .headline4
    //                     .copyWith(fontSize: 10.0)),
    //           ),
    //         ],
    //       ),
    //     ),
    //     Container(
    //       height: 0.5,
    //       margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
    //       decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //             begin: Alignment.centerRight,
    //             end: Alignment.centerLeft,
    //             colors: [Colors.purple, Colors.deepPurple]),
    //       ),
    //     ),
    //   ],
    // );
  }
}
