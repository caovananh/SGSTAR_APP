// Dart imports:
import 'dart:async';
import 'dart:convert';
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:infixedu/config/app_config.dart';
import 'package:infixedu/screens/login/login_new.dart';
import 'package:infixedu/screens/regsiter.dart';

// Project imports:
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/server/Login.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  String user;
  String email;
  Future<String> futureEmail;
  String password = '123456';
  bool isResponse = false;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  String _notificationToken;

  @override
  void initState() {
    firebaseNotificationSetup();
    super.initState();
  }

  firebaseNotificationSetup() async {
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
      _notificationToken = value;
      print(_notificationToken);
    });
    print('User granted permission: ${settings.authorizationStatus}');
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(""),
                  Text(""),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: OutlinedButton(
                      onPressed: () {
                        // Respond to button press
                      },
                      child: const Text('ENGLISH'),
                      style: TextButton.styleFrom(
                        primary: const Color(0xff13438f),
                        side: const BorderSide(
                            color: Color(0xff13438f), width: 1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Center(
                    child: Container(
                      height: 250.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(AppConfig.loginLogo),
                      )),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          style: textStyle,
                          controller: emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'please enter a valid email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide:
                                    BorderSide(color: Color(0xFF9EDEFF)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF9EDEFF)),
                              ),
                              hintText: "email",
                              labelText: "Email",
                              labelStyle: textStyle,
                              errorStyle: TextStyle(
                                  color: Colors.pinkAccent, fontSize: 15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => RegisterWidget()),
                            // );
                          },
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 15.0),
                              child: Text(
                                'Forgot Email/Phone Number? ',
                                style: TextStyle(color: Colors.grey),
                                textAlign: TextAlign.end,
                              ))),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          style: textStyle,
                          controller: passwordController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'please enter a valid password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide:
                                    BorderSide(color: Color(0xFF9EDEFF)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF9EDEFF)),
                              ),
                              hintText: "password",
                              labelText: "Password",
                              labelStyle: textStyle,
                              errorStyle: TextStyle(
                                  color: Colors.pinkAccent, fontSize: 15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => RegisterWidget()),
                            // );
                          },
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                'Forgot Password? ',
                                style: TextStyle(color: Colors.grey),
                                textAlign: TextAlign.end,
                              ))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              child: Text(
                "REGISTER",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  String email = emailController.text;
                  String password = passwordController.text;

                  if (email.length > 0 && password.length > 0) {
                    setState(() {
                      isResponse = true;
                    });
                    Login(email, password).getData2(context).then((result) {
                      setState(() {
                        isResponse = false;
                      });
                      Utils.showToast(result);
                    });
                  } else {
                    setState(() {
                      isResponse = false;
                    });
                    Utils.showToast('invalid email and password');
                  }
                }
              },
              color: Color(0xFF9EDEFF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Color(0xFF9EDEFF))),
            ),
            // GestureDetector(
            //   child: Container(
            //     alignment: Alignment.center,
            //     width: MediaQuery.of(context).size.width,
            //     height: 50.0,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(25.0),
            //       color: Color(0xFF7dd3f7),
            //     ),
            //     child: Text(
            //       "REGISTER",
            //       style: Theme.of(context)
            //           .textTheme
            //           .headline5
            //           .copyWith(color: Colors.white),
            //     ),
            //   ),
            //   onTap: () {
            //     if (_formKey.currentState.validate()) {
            //       String email = emailController.text;
            //       String password = passwordController.text;
            //
            //       if (email.length > 0 && password.length > 0) {
            //         setState(() {
            //           isResponse = true;
            //         });
            //         Login(email, password).getData2(context).then((result) {
            //           setState(() {
            //             isResponse = false;
            //           });
            //           Utils.showToast(result);
            //         });
            //       } else {
            //         setState(() {
            //           isResponse = false;
            //         });
            //         Utils.showToast('invalid email and password');
            //       }
            //     }
            //   },
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: isResponse == true
                  ? LinearProgressIndicator(
                      backgroundColor: Colors.transparent,
                    )
                  : Text(''),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> getEmail(String user) async {
    final response = await http.get(Uri.parse(InfixApi.getEmail));
    print(response.body);
    var jsonData = json.decode(response.body);

    //print(InfixApi.getDemoEmail(schoolId));

    return jsonData['data'][user]['email'];
  }
}
