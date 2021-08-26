// Dart imports:
import 'dart:async';
import 'dart:convert';
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:infixedu/config/app_config.dart';
import 'package:infixedu/screens/login/login_new.dart';
import 'package:infixedu/screens/regsiter.dart';

// Project imports:
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/server/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name;
  final storage = new FlutterSecureStorage();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  String user;
  String email;
  Future<String> futureEmail;
  String password = '123456';
  bool isResponse = false;
  bool _isChecked = false;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  String _notificationToken;

  String emailNow;

  @override
  void initState() {
    _loadUserEmailPassword();
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

    MediaQueryData mediaQueryData = MediaQuery.of(context);
    mediaQueryData.size.width;
    mediaQueryData.size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: mediaQueryData.size.height * 0.05,
                      right: mediaQueryData.size.width * 0.1),
                  child: OutlinedButton(
                    onPressed: () {
                      // Respond to button press
                    },
                    child: const Text('ENGLISH'),
                    style: TextButton.styleFrom(
                      primary: const Color(0xff13438f),
                      side:
                          const BorderSide(color: Color(0xff13438f), width: 1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    width: 100,
                    height: 100,
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: const Color(0xff7cd3f7),
                        ),
                        shape: BoxShape.circle,
                        color: Colors.white),
                    child: Image.asset('assets/images/icons/student1.png'),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      getName() != null ? getName() : 'null',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff13438f),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: ListView(
                    children: <Widget>[
                      Visibility(
                        visible: false,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            style: textStyle,
                            controller: emailController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0,top: 10.0),
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
                          onTap: () {},
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                'Forgot Password? ',
                                style: TextStyle(color: Colors.grey),
                                textAlign: TextAlign.end,
                              ))),
                      // Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       SizedBox(
                      //           height: 24.0,
                      //           width: 24.0,
                      //           child: Theme(
                      //             data: ThemeData(
                      //                 unselectedWidgetColor:
                      //                     Color(0xff00C8E8) // Your color
                      //                 ),
                      //             child: Checkbox(
                      //                 activeColor: Color(0xff00C8E8),
                      //                 value: _isChecked,
                      //                 onChanged: _handleRemeberme),
                      //           )),
                      //       SizedBox(width: 10.0),
                      //       Text("Remember Me",
                      //           style: TextStyle(
                      //               color: Color(0xff646464),
                      //               fontSize: 12,
                      //               fontFamily: 'Rubic'))
                      //     ]),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FlatButton(
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  String email = emailController.text;
                                  String password = passwordController.text;

                                  if (email.length > 0 && password.length > 0) {
                                    setState(() {
                                      isResponse = true;
                                      _handleRemeberme(true);
                                    });
                                    Login(email, password)
                                        .getData2(context)
                                        .then((result) {
                                      setState(() {
                                        isResponse = false;
                                      });
                                      Utils.showToast(result);
                                    });
                                  } else {
                                    setState(() {
                                      isResponse = false;
                                    });
                                    Utils.showToast(
                                        'invalid email and password');
                                  }
                                }
                              },
                              color: Color(0xFF9EDEFF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Color(0xFF9EDEFF))),
                            ),
                            Center(
                              child: const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  'Face ID',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff13438f),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                width: 80,
                                height: 80,
                                padding: const EdgeInsets.fromLTRB(10, 2, 2, 2),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: const Color(0xff13438f),
                                    ),
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Image.asset(
                                    'assets/images/icons/sgsis_big_icon.png'),
                              ),
                            ),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
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

  void _loadUserEmailPassword() async {
    print("Load Email");
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;

      print(_remeberMe);
      print(_email);
      print(_password);
      if (_remeberMe) {
        setState(() {
          _isChecked = true;
        });
        emailController.text = _email ?? "";
        passwordController.text = _password ?? "";
      }
    } catch (e) {
      print(e);
    }
  }

  void _handleRemeberme(bool value) {
    print("Handle Rember Me");
    _isChecked = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', emailController.text);
        prefs.setString('password', passwordController.text);
      },
    );
    setState(() {
      _isChecked = value;
    });
  }

  String getName() {
    Utils.getStringValue('full_name').then((value) {
      setState(() {
        name = value;
      });
    });
    return name;
  }
}
