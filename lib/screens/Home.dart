// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:edge_alert/edge_alert.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:infixedu/config/app_config.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timeago/timeago.dart' as timeago;

// Project imports:
import 'package:infixedu/screens/student/Profile.dart';
import 'package:infixedu/utils/CardItem.dart';
import 'package:infixedu/utils/FunctinsData.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/model/UserNotifications.dart';
import 'package:infixedu/utils/widget/ScaleRoute.dart';
import '../main.dart';
import 'ChangePassword.dart';

//notificatiopn handler
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// Streams are created so that app can respond to notification-related events since the plugin is initialised in the `main` function
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();

class ReceivedNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReceivedNotification(
      {@required this.id,
      @required this.title,
      @required this.body,
      @required this.payload});
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);

// ignore: must_be_immutable
class Home extends StatefulWidget {
  var _titles;
  var _images;

  Home(this._titles, this._images);

  @override
  _HomeState createState() => _HomeState(_titles, _images);
}

class _HomeState extends State<Home> {
  bool isTapped;
  int currentSelectedIndex;
  int rtlValue;
  String _email;
  String _password;
  String _rule;
  String _id;
  String schoolId;
  String isAdministrator;
  var _titles;
  var _images;
  var _token;
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  String _notificationToken;

  _HomeState(this._titles, this._images);

  Future notificationCount;

  @override
  void dispose() {
    didReceiveLocalNotificationSubject.close();
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Utils.getStringValue('token').then((value) {
      _token = value;
    });
    Utils.getStringValue('email').then((value) {
      _email = value;
    });
    Utils.getStringValue('password').then((value) {
      _password = value;
    });
    Utils.getStringValue('schoolId').then((value) {
      schoolId = value;
    });
    Utils.getStringValue('rule').then((value) {
      _rule = value;
    });
    Utils.getStringValue('id').then((value) {
      _id = value;
      notificationCount = getNotificationCount(int.parse(_id));
    });
    Utils.getStringValue('isAdministrator').then((value) {
      isAdministrator = value;
    });
    Utils.getIntValue('locale').then((value) {
      setState(() {
        rtlValue = value;
      });
    });

    //init settings for android
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification:
            (int id, String title, String body, String payload) async {
      didReceiveLocalNotificationSubject.add(ReceivedNotification(
          id: id, title: title, body: body, payload: payload));
    });
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
      if (payload != null) {
        debugPrint('notification payload: ' + payload);
      }
      selectNotificationSubject.add(payload);
    });

    didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != null
              ? Text(receivedNotification.title)
              : null,
          content: receivedNotification.body != null
              ? Text(receivedNotification.body)
              : null,
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Ok'),
              onPressed: () async {},
            )
          ],
        ),
      );
    });
    selectNotificationSubject.stream.listen((String payload) async {});
    this.notificationSubscription();
    isTapped = false;
  }

  notificationSubscription() async {
    print('token get');
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    messaging.getToken().then((value) {
      setState(() {
        _notificationToken = value;
        sendTokenToServer(_notificationToken);
        print('Notify TOKEN Got: $_notificationToken');
      });
    });
    print('User granted permission: ${settings.authorizationStatus}');

    // sendTokenToServer(_notificationToken); // TODO:: SEND TOKEN TO API

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // print('Got a message whilst in the foreground!');
      // print("Notification Title : ${message.notification.title}");
      // print("Notification Body: ${message.notification.body}");
      // print('DATA: ${message.data.toString()}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        if (mounted) {
          EdgeAlert.show(
            context,
            title: message.notification.title,
            description: message.notification.body,
            gravity: EdgeAlert.TOP,
            backgroundColor: Colors.deepPurple,
            icon: Icons.notifications_active,
            duration: 5,
          );
        }

        RemoteNotification notification = message.notification;

        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        if (mounted) {
          EdgeAlert.show(
            context,
            title: message.notification.title,
            description: message.notification.body,
            gravity: EdgeAlert.TOP,
            backgroundColor: Colors.deepPurple,
            icon: Icons.notifications_active,
            duration: 5,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.deepPurple, //or set color with: Color(0xFF0000FF)
    ));

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: AppBar(
            centerTitle: false,
            flexibleSpace: Container(
              height: 70.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppConfig.appToolbarBackground),
                  fit: BoxFit.fill,
                ),
                color: Colors.deepPurple,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      AppConfig.appLogo,
                      width: ScreenUtil().setWidth(65.0),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setHeight(50),
                    child: FutureBuilder(
                        future: notificationCount,
                        builder: (context, countSnap) {
                          if (countSnap.hasData) {
                            print("count:  ${countSnap.data}");
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  notificationCount =
                                      getNotificationCount(int.parse(_id));
                                });
                                buildNotificationDialog(context, _id);
                              },
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: Icon(
                                        FontAwesomeIcons.solidBell,
                                        size: ScreenUtil().setSp(30),
                                      )),
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: Container(
                                      width: ScreenUtil().setWidth(20),
                                      height: ScreenUtil().setWidth(20),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.purpleAccent,
                                              Colors.deepPurpleAccent
                                            ]),
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(50)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          countSnap.data >= 99
                                              ? "99+"
                                              : countSnap.data.toString(),
                                          // countSnap.data.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3
                                              .copyWith(
                                                color: Colors.white,
                                                fontSize: ScreenUtil().setSp(12),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return InkWell(
                              onTap: () {},
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: Icon(
                                        FontAwesomeIcons.solidBell,
                                        size: ScreenUtil().setSp(30),
                                      )),
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: Container(
                                      width: ScreenUtil().setWidth(20),
                                      height: ScreenUtil().setWidth(20),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.purpleAccent,
                                            Colors.deepPurpleAccent
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(50)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "0",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3
                                              .copyWith(
                                                color: Colors.white,
                                                fontSize: ScreenUtil().setSp(12),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        }),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: FutureBuilder(
                      future: Utils.getStringValue('email'),
                      builder:
                          (BuildContext context, AsyncSnapshot<String> snapshot) {
                        return getProfileImage(context, _email, _password, _rule);
                      },
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            itemCount: _titles.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) {
              return CustomWidget(
                index: index,
                isSelected: currentSelectedIndex == index,
                onSelect: () {
                  setState(() {
                    currentSelectedIndex = index;
                    if (_rule == '2') {
                      AppFunction.getDashboardPage(context, _titles[index],
                          id: _id, token: _token);
                    } else if (_rule == '4') {
                      AppFunction.getTeacherDashboardPage(
                          context, _titles[index], _id);
                    } else if (_rule == '3') {
                      AppFunction.getParentDashboardPage(
                          context, _titles[index], _id);
                    } else if (_rule == '1' || _rule == '5') {
                      if (isAdministrator == 'yes') {
                        AppFunction.getSaasAdminDashboardPage(
                            context, _titles[index], _id);
                      } else {
                        AppFunction.getAdminDashboardPage(
                            context, _titles[index], _id);
                      }
                    }
                  });
                },
                headline: _titles[index],
                icon: _images[index],
              );
            },
          ),
        ),
      ),
    );
  }

  buildNotificationDialog(context, String id) {
    showDialog<void>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration:
                      BoxDecoration(shape: BoxShape.rectangle, boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple,
                      blurRadius: 20.0,
                    ),
                  ]),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 20.0, right: 15.0),
                      child: FutureBuilder<UserNotificationList>(
                          future: getNotifications(int.parse(id)),
                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data != null) {
                              if (snapshot.data.userNotifications.length == 0) {
                                return Container(
                                  child: Text(
                                    "No new notifications",
                                    textAlign: TextAlign.end,
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                );
                              } else {
                                return Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        shrinkWrap: false,
                                        itemCount: snapshot
                                            .data.userNotifications.length,
                                        itemBuilder: (context, index) {
                                          final item = snapshot
                                              .data.userNotifications[index];
                                          return Material(
                                            color: Colors.transparent,
                                            clipBehavior: Clip.antiAlias,
                                            child: Dismissible(
                                              key: Key(item.id.toString()),
                                              background: Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        Colors.purpleAccent,
                                                        Colors.deepPurpleAccent
                                                      ]),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      spreadRadius: 1,
                                                      blurRadius: 6,
                                                      offset: Offset(1,
                                                          1), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onDismissed: (direction) async {
                                                var response = await http.get(
                                                    Uri.parse(InfixApi
                                                        .readMyNotifications(
                                                            int.parse(id),
                                                            snapshot
                                                                .data
                                                                .userNotifications[
                                                                    index]
                                                                .id)),
                                                    headers: Utils.setHeader(
                                                        _token.toString()));

                                                if (response.statusCode ==
                                                    200) {
                                                  Map<String, dynamic>
                                                      notifications =
                                                      jsonDecode(response.body)
                                                          as Map;
                                                  bool status =
                                                      notifications['data']
                                                          ['status'];
                                                  if (status == true) {
                                                    setState(() {
                                                      print("Index :$index");
                                                      snapshot.data
                                                          .userNotifications
                                                          .removeAt(index);
                                                    });
                                                  }
                                                } else {
                                                  print(
                                                      'Error retrieving from api');
                                                }
                                                setState(() {
                                                  notificationCount =
                                                      getNotificationCount(
                                                          int.parse(_id));
                                                });
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "${item.message} read")));
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    FontAwesomeIcons.solidBell,
                                                    color: Colors.deepPurple,
                                                    size:
                                                        ScreenUtil().setSp(15),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        item.message,
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5
                                                            .copyWith(
                                                              fontSize:
                                                                  ScreenUtil()
                                                                      .setSp(
                                                                          13),
                                                            ),
                                                      ),
                                                      Text(
                                                        timeago.format(
                                                            item.createdAt),
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5
                                                            .copyWith(
                                                              fontSize:
                                                                  ScreenUtil()
                                                                      .setSp(
                                                                          12),
                                                            ),
                                                      ),
                                                      SizedBox(
                                                        height: 12,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        var response = await http.get(
                                            Uri.parse(
                                                InfixApi.readAllNotification(
                                              int.parse(id),
                                            )),
                                            headers: Utils.setHeader(
                                                _token.toString()));
                                        print(response.statusCode);
                                        if (response.statusCode == 200) {
                                          Map<String, dynamic> notifications =
                                              jsonDecode(response.body) as Map;
                                          bool status =
                                              notifications['data']['status'];
                                          if (status == true) {
                                            print('readall');
                                          }
                                        } else {
                                          print('Error retrieving from api');
                                        }
                                        setState(() {
                                          notificationCount =
                                              getNotificationCount(
                                                  int.parse(_id));
                                          Navigator.of(context).pop();
                                        });
                                      },
                                      child: Text(
                                        'Mark all as read',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(
                                              fontSize: ScreenUtil().setSp(12),
                                              color: Colors.white,
                                            ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.deepPurple,
                                      ),
                                    ),
                                  ],
                                );
                              }
                            } else {
                              return Center(
                                  child: CupertinoActivityIndicator());
                            }
                          }),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text("Cancel",style: Theme.of(context)
          .textTheme
          .headline5
          .copyWith(
        fontSize: ScreenUtil().setSp(12),
        color: Colors.red,
      ),),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget yesButton = TextButton(
      child: Text("Yes",style: Theme.of(context)
          .textTheme
          .headline5
          .copyWith(
        fontSize: ScreenUtil().setSp(12),
        color: Colors.green,
      ),),
      onPressed: () async {
        Utils.clearAllValue();
        Utils.saveIntValue('locale', rtlValue);
        Route route = MaterialPageRoute(builder: (context) => MyApp());
        Navigator.pushAndRemoveUntil(context, route, ModalRoute.withName('/'));

        var response = await http.post(Uri.parse(InfixApi.logout()),
            headers: Utils.setHeader(_token.toString()));
        if (response.statusCode == 200) {
        } else {
          Utils.showToast('Unable to logout');
        }
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(
        "Logout",
        style: Theme.of(context).textTheme.headline5,
      ),
      content: Text("Would you like to logout?"),
      actions: [
        cancelButton,
        yesButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showStudentProfileDialog(BuildContext context) {
    showDialog<void>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                      shape: BoxShape
                          .rectangle, // BoxShape.circle or BoxShape.retangle
                      //color: const Color(0xFF66BB6A),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple,
                          blurRadius: 20.0,
                        ),
                      ]),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 20.0, right: 15.0),
                        child: ListView(
                          children: <Widget>[
                            InkWell(
                              child: SizedBox(
                                child: Text(
                                  "Profile",
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    ScaleRoute(
                                        page: Profile(
                                      id: _id,
                                    )));
                              },
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(ScaleRoute(page: ChangePassword()));
                              },
                              child: SizedBox(
                                child: Text(
                                  "Change Password",
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ),
                            ),
                            InkWell(
                              child: SizedBox(
                                child: Text(
                                  "Logout",
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ),
                              onTap: () {
                                showAlertDialog(context);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  showOthersProfileDialog(BuildContext context) {
    showDialog<void>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                      shape: BoxShape
                          .rectangle, // BoxShape.circle or BoxShape.retangle
                      //color: const Color(0xFF66BB6A),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.shade300,
                          blurRadius: 20.0,
                        ),
                      ]),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 20.0, right: 15.0),
                      child: ListView(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(ScaleRoute(page: ChangePassword()));
                            },
                            child: Text(
                              "Change Password",
                              textAlign: TextAlign.end,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          GestureDetector(
                            child: Text(
                              "Logout",
                              textAlign: TextAlign.end,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            onTap: () {
                              showAlertDialog(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget getProfileImage(
      BuildContext context, String email, String password, String rule) {
    return FutureBuilder(
      future: Utils.getStringValue('image'),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          // print('Profile Image: ${snapshot.data}');
          Utils.saveStringValue('image', snapshot.data);
          return GestureDetector(
            onTap: () {
              rule == '2'
                  ? showStudentProfileDialog(context)
                  : showOthersProfileDialog(context);
            },
            child: Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: ScreenUtil().setSp(22),
                child: CachedNetworkImage(
                  imageUrl: InfixApi.root + snapshot.data,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                  placeholder: (context, url) => CupertinoActivityIndicator(),
                  errorWidget: (context, url, error) => CachedNetworkImage(
                    imageUrl: InfixApi.root + 'public/uploads/staff/demo/staff.jpg',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    placeholder: (context, url) => CupertinoActivityIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              rule == '2'
                  ? showStudentProfileDialog(context)
                  : showOthersProfileDialog(context);
            },
            child: CircleAvatar(
              radius: 22,
              child: Container(
                alignment: Alignment.center,
                child: CachedNetworkImage(
                  imageUrl: "https://i.imgur.com/7PqjiH7.jpeg",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                  placeholder: (context, url) => CupertinoActivityIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Future<String> getImageUrl(String email, String password, String rule) async {
    var image = 'http://saskolhmg.com/images/studentprofile.png';

    var response = await http.get(Uri.parse(InfixApi.login(email, password)));

    if (response.statusCode == 200) {
      Map<String, dynamic> user = jsonDecode(response.body) as Map;
      if (rule == '2')
        image = InfixApi.root + user['data']['userDetails']['student_photo'];
      else if (rule == '3')
        image = InfixApi.root + user['data']['userDetails']['fathers_photo'];
      else
        image = InfixApi.root + user['data']['userDetails']['staff_photo'];
    }
    return image == InfixApi.root
        ? 'http://saskolhmg.com/images/studentprofile.png'
        : '$image';
  }

  Future<int> getNotificationCount(int id) async {
    var count = 0;

    var response = await http.get(Uri.parse(InfixApi.getMyNotifications(id)),
        headers: Utils.setHeader(_token.toString()));

    if (response.statusCode == 200) {
      Map<String, dynamic> notifications = jsonDecode(response.body) as Map;
      count = notifications['data']['unread_notification'];
      // count = 120;
    } else {
      print('Error retrieving from api');
      count = 0;
    }
    return count;
  }

  Future<UserNotificationList> getNotifications(int id) async {
    final response = await http.get(Uri.parse(InfixApi.getMyNotifications(id)),
        headers: Utils.setHeader(_token.toString()));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return UserNotificationList.fromJson(jsonData['data']['notifications']);
    } else {
      throw Exception('failed to load');
    }
  }

  void navigateToPreviousPage(BuildContext context) {
    Navigator.pop(context);
  }

  void sendTokenToServer(String token) async {
    print('Send token: $token');
    final response = await http.get(Uri.parse(InfixApi.setToken(_id, token)),
        headers: Utils.setHeader(_token));

    print(response.body);
    if (response.statusCode == 200) {
      print(response.body.toString());
      print('token updated : $token');
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<void> onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    await showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: title != null ? Text(title) : null,
        content: body != null ? Text(body) : null,
        actions: [],
      ),
    );
  }

// static Future<void> _showNotification(String title, String body) async {
//   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'infixEdu', 'infix', 'this channel description',
//       importance: Importance.max, priority: Priority.high, ticker: 'ticker');
//   var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//   var platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: iOSPlatformChannelSpecifics);
//   await flutterLocalNotificationsPlugin.show(
//       0, '$title', '$body', platformChannelSpecifics,
//       payload: 'infixEdu');
// }
}
