import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/BusScreen/BusWidgets/ChangeCancel.dart';
import 'package:infixedu/screens/new_student/BusScreen/BusWidgets/bus_history.dart';
import 'package:infixedu/screens/new_student/BusScreen/GuardianRegister.dart';
import 'package:infixedu/screens/new_student/BusScreen/RegisterBus.dart';
import 'package:infixedu/screens/new_student/BusScreen/RouteTracking.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarMainScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BusScreen extends StatefulWidget {
  const BusScreen({key}) : super(key: key);

  @override
  _BusScreenState createState() => _BusScreenState();
}

class _BusScreenState extends State<BusScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      appBar: AppBarMainScreen(),
      body: Container(
        child: Container(
          child: GridView.count(
            childAspectRatio: (100 / 165),
            primary: true,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 20,
            mainAxisSpacing: 0,
            crossAxisCount: shortestSide < 600 ? 3 : 6,
            children: <Widget>[
              Container(
                  child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _navigate(1);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/icons/survey.png')),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: const Color(0xFF7dd3f7),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Register bus'.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color(0xff07509d)),
                      textAlign: TextAlign.center,
                    ),
                  )),
                ],
              )),
              Container(
                  child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _navigate(2);
                    },
                    child: Container(
                      height: 100,
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                'assets/images/icons/daily_activities.png')),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: const Color(0xFF7dd3f7),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'history bus'.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color(0xff07509d)),
                      textAlign: TextAlign.center,
                    ),
                  ))
                ],
              )),
              Container(
                  child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _navigate(3);
                    },
                    child: Container(
                      height: 100,
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image:AssetImage('assets/images/icons/route.jpg')),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: const Color(0xFF7dd3f7),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'route tracking'.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color(0xff07509d)),
                      textAlign: TextAlign.center,
                    ),
                  ))
                ],
              )),
              Container(
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          _navigate(4);
                        },
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image:AssetImage('assets/images/icons/cancel.jpg')),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: const Color(0xFF7dd3f7),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              'change/cancel'.toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Color(0xff07509d)),
                              textAlign: TextAlign.center,
                            ),
                          ))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _navigate(int num) {
    switch (num) {
      case 1:
        pushNewScreen(
          context,
          screen: RegisterBus(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        break;
      case 2:
        pushNewScreen(
          context,
          screen: BusHistory(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        break;
      case 3:
        pushNewScreen(
          context,
          screen: RouteTracking(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        break;
      case 4:
        pushNewScreen(
          context,
          screen: ChangeCancel(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        break;
      default:
        break;
    }
  }
}
