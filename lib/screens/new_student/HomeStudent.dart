import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/login/login_new.dart';
import 'package:infixedu/screens/new_student/BusScreen/BusScreen.dart';
import 'package:infixedu/screens/new_student/ChatScreen/ChatScreen.dart';
import 'package:infixedu/screens/new_student/ELearningScreen/ElearningScreen.dart';
import 'package:infixedu/screens/new_student/HomeScreen/HomeScreen.dart';
import 'package:infixedu/screens/new_student/SettingScreen/SettingsScreen.dart';
import 'package:infixedu/screens/new_student/studentScreen/StudentScreen.dart';
import 'package:infixedu/screens/new_student/absent.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'CommonWidgets/AppBarWidget.dart';

class StudentHome extends StatefulWidget {
  var _titles;
  var _images;

  StudentHome(this._titles, this._images);
  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  String name;
  String rule;
  int _selectedIndex = 0;
  var _pageController = PageController();
  @override
  void initState() {
    super.initState();
    setState(() {
      Utils.getStringValue('rule').then((value) {
        rule = value;
      });
    });
  }

  var _pages = [
    HomeScreen(),
    StudentScreen(),
    ChatScreen(),
    BusScreen(),
    ELearningScreen(),
    SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBarWidget(),
        body: PageView(
          children: _pages,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          controller: _pageController,
        ),
        // body: Center(child: _pages[_selectedIndex],),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          FloatingActionButton(
            backgroundColor: const Color(0xFF7dd3f7),
            heroTag: Text("btn1"),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                "assets/images/icons/notification.png",
              ),
              backgroundColor: const Color(0xFF7dd3f7),
            ),
            onPressed: () {
              clear();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20),
              child: FloatingActionButton(
                  backgroundColor: const Color(0xFF7dd3f7),
                  heroTag: Text("btn2"),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      "assets/images/icons/hotline.png",
                    ),
                    backgroundColor: const Color(0xFF7dd3f7),
                  ),
                  onPressed: () => launch('tel://84362134802'))),
        ]),
        bottomNavigationBar: bottomNavBar());
  }

  Widget bottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xFF7dd3f7),
            selectedItemColor: Color(0xff191970),
            unselectedItemColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/icons/home.png'),
                  size: 40,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/icons/student.png'),
                  size: 40,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/icons/chat.png'),
                  size: 40,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/icons/bus.png'),
                  size: 40,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/icons/elearning.png'),
                  size: 40,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/icons/setting.png'),
                  size: 40,
                ),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  void _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(_selectedIndex,
          duration: Duration(microseconds: 200), curve: Curves.linear);
    });
  }

  Widget appBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          toolbarHeight: 100,
          primary: false,
          centerTitle: false,
          title: Row(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage:
                          AssetImage('assets/images/icons/student1.png'),
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          getName() != null ? getName() : 'null',
                          style: TextStyle(
                              color: const Color(0xff191970), fontSize: 23.0),
                        ))
                  ],
                ),
              ),
            ],
          ),
          flexibleSpace: Image(
            image: AssetImage('assets/images/tool_bar_bg.png'),
            fit: BoxFit.cover,
            height: 100.0,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ));
  }

  Future<void> clear() async {
    // print(widget._images);
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
  }

  String getName() {
    Utils.getStringValue('full_name').then((value) {
      setState(() {
        name = value;
      });
    });
    return name;
  }

  body(_selectedIndex) {
    switch (_selectedIndex) {
      case 0:
        return HomeScreen();
        break;
      case 1:
        return StudentScreen();
        break;
      case 2:
        return ChatScreen();
        break;
      case 3:
        return BusScreen();
        break;
      case 4:
        return ELearningScreen();
        break;
      case 5:
        return SettingScreen();
        break;
      default:
        return Center(
          child: Text('Loading'),
        );
        break;
    }
  }
}
