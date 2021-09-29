// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:permissions_plugin/permissions_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/model/zoom_meeting.dart';
import 'package:infixedu/webview/zoom_launch_meeting.dart';
import 'ScaleRoute.dart';

// ignore: must_be_immutable
class ZoomMeetingRow extends StatefulWidget {
  ZoomMeeting zoomMeeting;

  ZoomMeetingRow(this.zoomMeeting);

  @override
  _DormitoryScreenState createState() => _DormitoryScreenState(zoomMeeting);
}

class _DormitoryScreenState extends State<ZoomMeetingRow> {
  ZoomMeeting zoomMeeting;

  _DormitoryScreenState(this.zoomMeeting);

  @override
  void initState() {
    checkPermissions(context);
    super.initState();
  }

  Future<void> checkPermissions(BuildContext context) async {
    Map<Permission, PermissionState> permission =
        await PermissionsPlugin.checkPermissions(
            [Permission.CAMERA, Permission.RECORD_AUDIO]);

    if (permission[Permission.CAMERA] != PermissionState.GRANTED ||
        permission[Permission.RECORD_AUDIO] != PermissionState.GRANTED) {
      try {
        permission = await PermissionsPlugin.requestPermissions([
          Permission.CAMERA,
          Permission.RECORD_AUDIO,
        ]);
      } on Exception {
        debugPrint("Error");
      }

      if (permission[Permission.CAMERA] != PermissionState.GRANTED ||
          permission[Permission.RECORD_AUDIO] != PermissionState.GRANTED)
        print("camera permission ok");
      else
        permissionsDenied(context);
    } else {
      print("write permission ok");
    }
  }

  void permissionsDenied(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext _context) {
          return SimpleDialog(
            title: const Text("Permission denied"),
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
                child: const Text(
                  "You must grant all permission to use this application",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Color(0xff7cd3f7), width: 1)),
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width - 40,
                height:
                    shortestSide >= 600 ? screenHeight / 3 : screenHeight / 4,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/pic4.png',
                        fit: BoxFit.cover),
                  ),
                )),
            DefaultTextStyle(
              style: TextStyle(
                  fontSize: shortestSide >= 600 ? 20 : 14, color: Colors.grey),
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: MediaQuery.of(context).size.height * 0.50,
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            'Topic name: ',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Text(
                            zoomMeeting.topic,
                            style: TextStyle(
                                color: Color(0xff7cd3f7),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            'Meeting id: ',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Text(
                            zoomMeeting.meetingId,
                            style: TextStyle(
                                color: Color(0xff7cd3f7),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            'Meeting password: ',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Text(
                            zoomMeeting.password,
                            style: TextStyle(
                                color: Color(0xff7cd3f7),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            'Meeting date: ',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Text(
                            zoomMeeting.startDate,
                            style: TextStyle(
                                color: Color(0xff7cd3f7),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            'Meeting time: ',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Text(
                            zoomMeeting.startTime,
                            style: TextStyle(
                                color: Color(0xff7cd3f7),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            'Teacher: ',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Text(
                            zoomMeeting.teacherName,
                            style: TextStyle(
                                color: Color(0xff7cd3f7),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(height: 40),
                      Center(
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xff7cd3f7),
                          ),
                          child: TextButton(
                            onPressed: () async {
                              final _url = InfixApi.getJoinMeetingUrlApp(
                                  mid: zoomMeeting.meetingId);

                              print(
                                  'App URL: ${InfixApi.getJoinMeetingUrlApp(mid: zoomMeeting.meetingId)}');
                              print(
                                  'Web URL: ${InfixApi.getJoinMeetingUrlWeb(mid: zoomMeeting.meetingId)}');
                              if (await canLaunch(_url)) {
                                await launch(_url);
                              } else {
                                Navigator.push(
                                    context,
                                    ScaleRoute(
                                        page: ZoomLaunchMeeting(
                                      meetingUrl: InfixApi.getJoinMeetingUrlWeb(
                                          mid: zoomMeeting.meetingId),
                                      meetingName: zoomMeeting.topic,
                                    )));
                              }
                            },
                            child: Text('join'.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
