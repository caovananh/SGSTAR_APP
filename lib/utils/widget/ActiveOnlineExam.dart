// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:infixedu/utils/model/ActiveOnlineExam.dart';

// ignore: must_be_immutable
class ActiveOnlineExamRow extends StatelessWidget {
  ActiveOnlineExam exam;

  ActiveOnlineExamRow(this.exam);

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    exam.title == null ? 'not assigned' : exam.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: ScreenUtil().setSp(15.0)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Subject',
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          exam.subject == null ? 'not assigned' : exam.subject,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Date',
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          exam.date == null ? 'not assigned' : exam.date,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                  // Expanded(
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: <Widget>[
                  //       Text(
                  //         'Status',
                  //         maxLines: 1,
                  //         style: Theme.of(context)
                  //             .textTheme
                  //             .headline4
                  //             .copyWith(fontWeight: FontWeight.w500),
                  //       ),
                  //       SizedBox(
                  //         height: 5.0,
                  //       ),
                  //       getExamStatusWidget(
                  //           context: context,
                  //           isRunning: exam.isRunning,
                  //           isClosed: exam.isClosed,
                  //           isWaiting: exam.isWaiting),
                  //     ],
                  //   ),
                  // ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Action',
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        getStatus(context, exam.status,exam.isRunning,exam.isClosed),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 0.5,
              margin: EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Colors.purple, Colors.deepPurple]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getExamStatusWidget(
      {BuildContext context, int isRunning, int isWaiting, int isClosed}) {

    if(isRunning == 1){
     return Text(
        'Running',
        textAlign: TextAlign.center,
        maxLines: 1,
        style: Theme.of(context)
            .textTheme
            .headline4
            .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
      );
    }else if(isWaiting == 1){
      return Text(
        'Pending',
        textAlign: TextAlign.center,
        maxLines: 1,
        style: Theme.of(context)
            .textTheme
            .headline4
            .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
      );
    }else if(isClosed == 1){
      return Text(
        'Closed',
        textAlign: TextAlign.center,
        maxLines: 1,
        style: Theme.of(context)
            .textTheme
            .headline4
            .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
      );
    }else {
      return Text(
        'not assigned',
        textAlign: TextAlign.center,
        maxLines: 1,
        style: Theme.of(context)
            .textTheme
            .headline4
            .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
      );
    }

  }

  Widget getStatus(BuildContext context, int status,int isRunning, int isClosed) {
    if (status == 1) {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.green.shade500),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            'Submitted',
            textAlign: TextAlign.center,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      );
    } else if (status == 0) {
      if(isClosed == 0){
        return InkWell(
          onTap: (){
            print('TAKE EXAM'); // TODO:: ONLINE EXAM TAKE
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.indigo.shade500),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Take Exam',
                textAlign: TextAlign.center,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        );
      }else{
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.red.shade500),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'Closed',
              textAlign: TextAlign.center,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
        );
      }

    } else {
      return Container();
    }
  }
}
