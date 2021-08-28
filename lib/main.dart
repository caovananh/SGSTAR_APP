// Flutter imports:
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:infixedu/screens/SplashScreen.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.deepPurple, //or set color with: Color(0xFF0000FF)
  ));

  // DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => MyApp(), // Wrap your app
  // );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  bool isRTL;

  @override
  void initState() {
    super.initState();

    Utils.getIntValue('locale').then((value) {
      setState(() {
        isRTL = value == 0 ? true : false;
        //Utils.showToast('$isRTL');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return isRTL != null
        ? isRTL
            ? ScreenUtilInit(
                designSize: Size(360, 690),
                builder: () => MaterialApp(
                      title: "infixEdu",
                      debugShowCheckedModeBanner: false,
                      theme: basicTheme(),
                      home: Stack(
                        children: [
                          FutureBuilder(
                              future: _initialization,
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Scaffold(
                                    body: Center(
                                      child: Text(
                                        snapshot.error.toString(),
                                      ),
                                    ),
                                  );
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return Scaffold(
                                    body: Splash(),
                                  );
                                }
                                return CircularProgressIndicator();
                              }),
                        ],
                      ),
                      localizationsDelegates: [
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: [
                        Locale("fa",
                            "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
                      ],
                    ))
            : ScreenUtilInit(
                designSize: Size(360, 690),
                builder: () => MaterialApp(
                  title: "InfixEdu",
                  debugShowCheckedModeBanner: false,
                  theme: basicTheme(),
                  home: Scaffold(
                    body: Splash(),
                  ),
                ),
              )
        : ScreenUtilInit(
            designSize: Size(360, 690),
            builder: () => Material(
                child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Center(child: CupertinoActivityIndicator()))));
  }
}
