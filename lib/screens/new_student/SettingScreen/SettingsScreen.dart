import 'package:flutter/material.dart';
import 'package:infixedu/screens/login/login_new.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarMainScreen.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/Logout.dart';
import 'package:infixedu/screens/new_student/SettingScreen/BankAccount.dart';
import 'package:infixedu/screens/new_student/SettingScreen/Contact.dart';
import 'package:infixedu/screens/new_student/SettingScreen/ContributionFeedback.dart';
import 'package:infixedu/screens/new_student/SettingScreen/ParentInformation.dart';
import 'package:infixedu/screens/new_student/SettingScreen/Support.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      appBar: AppBarMainScreen(),
      body: Container(
          child:  Container(
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
                        Container(
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: const Color(0xFF7dd3f7),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              _navigate(1);
                            },
                            child: Image(
                                image: AssetImage(
                                    'assets/images/icons/std_info.png')),
                          ),
                        ),
                        Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                'Parent information'.toUpperCase(),
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
                        Container(
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: const Color(0xFF7dd3f7),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              _navigate(2);
                            },
                            child: Image(
                                image: AssetImage(
                                    'assets/images/icons/daily_activities.png')),
                          ),
                        ),
                        Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                'bank account'.toUpperCase(),
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
                        Container(
                            padding: const EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 2,
                                color: const Color(0xFF7dd3f7),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                _navigate(3);
                              },
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/icons/survey.png')),
                            )),
                        Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                'contacts'.toUpperCase(),
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
                        Container(
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: const Color(0xFF7dd3f7),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              _navigate(4);
                            },
                            child: Image(
                                image: AssetImage(
                                    'assets/images/icons/std_absent.png')),
                          ),
                        ),
                        Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                'support'.toUpperCase(),
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
                        Container(
                            padding: const EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 2,
                                color: const Color(0xFF7dd3f7),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                _navigate(5);
                              },
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/icons/note.png')),
                            )),
                        Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                'contributions & feedback'.toUpperCase(),
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
                        Container(
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: const Color(0xFF7dd3f7),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              _navigate(6);
                            },
                            child: Image(
                                image: AssetImage(
                                    'assets/images/icons/leave.png')),
                          ),
                        ),
                        Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                'log out'.toUpperCase(),
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
          screen: ParentInformation(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        break;
      case 2:
        pushNewScreen(
          context,
          screen: BankAccount(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        break;
      case 3:
        pushNewScreen(
          context,
          screen: Contact(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        break;
      case 4:
        pushNewScreen(
          context,
          screen: SupportBus(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        break;
      case 5:
        pushNewScreen(
          context,
          screen: ContributionsFeedback(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        break;
      case 6:
        _logout();
        break;
      default:
        break;
    }
  }
  Future<void> clear() async {
    // print(widget._images);
    final pref = await SharedPreferences.getInstance();
    await pref.remove('isLogged');
    // await pref.clear();

    pushNewScreen(
      context,
      screen: LoginPage(),
      withNavBar: false, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  getRemember() async {
    final pref = await SharedPreferences.getInstance();
    bool remember = pref.get('remember_me');
    print(remember);
  }

  void getAll() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();

    final prefsMap = Map<String, dynamic>();
    for (String key in keys) {
      prefsMap[key] = prefs.get(key);
    }
    print(prefsMap);
  }
  void _logout() async {
    // print(widget._images);
    final pref = await SharedPreferences.getInstance();
    await pref.remove('isLogged');
    // await pref.clear();

    pushNewScreen(
      context,
      screen: Logout(),
      withNavBar: false, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}
