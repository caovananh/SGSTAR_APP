import 'dart:async';
import 'package:flutter/material.dart';
import 'package:infixedu/localization/app_translations.dart';
import 'package:infixedu/localization/app_translations_delegate.dart';
import 'package:infixedu/localization/application.dart';
import 'package:infixedu/utils/FunctinsData.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AppTranslationsDelegate _newLocaleDelegate;
  AppTranslations appTranslations;
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    // application.onLocaleChanged = onLocaleChange;

    //getting language code from memory and using this code we fetch translated data from asset/locale
    //disable this function since we only use English
    // Utils.getStringValue('lang').then((value) {
    //   if (value != null) {
    //     _newLocaleDelegate = AppTranslationsDelegate(newLocale: Locale(value));
    //     _newLocaleDelegate.load(Locale(value)).then((val) {
    //       if (!mounted) return;
    //       setState(() {
    //         appTranslations = val;
    //       });
    //     });
    //   }
    // });

    Route route;
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 30.0, end: 90.0).animate(controller);
    controller.forward();

    // Future.delayed(Duration(seconds: 1), () {
    //   getBooleanValue('isLogged').then((value) {
    //     if (value) {
    //       Utils.getStringValue('rule').then((rule) {
    //         AppFunction.getFunctions(context, rule);
    //       });
    //     } else {
    //       route = MaterialPageRoute(builder: (context) => LoginScreen());
    //       Navigator.pushReplacement(context, route);
    //     }
    //   });
    // });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash_bg.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: <Widget>[
                  // Container(
                  //   alignment: Alignment.topCenter,
                  //   height: 10.0,
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage('assets/images/line.png'),
                  //       fit: BoxFit.fitWidth,
                  //     ),
                  //   ),
                  // ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 20.0, top: 30.0),
                          child: Text(
                            appTranslations != null
                                ? appTranslations.text('Welcome to')
                                : 'WELCOME!',
                            style: TextStyle(
                              color: Color(0xff07509d),
                              fontSize: 40.0,
                              fontFamily: 'popins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 80.0, top: 10.0),
                          child: Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff07509d),
                                fontSize: 20.0,
                                fontFamily: 'popins',
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(22.0),
                            ),
                            color: Color(0xFF58b6ed), // background
                            textColor: Colors.white, // foreground
                            onPressed: () {
                              getBooleanValue('isLogged');
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Text(
                                "LET'S GO",
                                style: TextStyle(
                                  color: Color(0xFFffffff),
                                  fontSize: 22.0,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> getBooleanValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var status = prefs.getBool(key) ?? false;
    if (status) {
      Utils.getStringValue('rule').then((rule) {
        Utils.getStringValue('zoom').then((zoom) {
          AppFunction.getFunctions(context, rule, zoom);
        });
      });
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false,
      );
    }
  }
}
