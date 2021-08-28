import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarMainScreen.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/FloatingButtons.dart';

import 'package:infixedu/screens/new_student/HomeScreen/Widgets/Curriculum.dart';
import 'package:infixedu/screens/new_student/HomeScreen/Widgets/news.dart';
import 'package:infixedu/screens/new_student/HomeScreen/Widgets/schoolLife.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTopBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMainScreen(),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: BottomNavigationBar(
                      backgroundColor: Colors.white,
                      selectedItemColor: Colors.transparent,
                      unselectedItemColor: Colors.transparent,
                      selectedFontSize: 00,
                      type: BottomNavigationBarType.fixed,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: CircleAvatar(
                            radius: 25.0,
                            backgroundImage: _selectedTopBarIndex == 0
                                ? AssetImage(
                                    'assets/images/icons/new_selected.png')
                                : AssetImage('assets/images/icons/new.png'),
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: CircleAvatar(
                            radius: 25.0,
                            backgroundImage: _selectedTopBarIndex == 1
                                ? AssetImage(
                                    'assets/images/icons/curriculum_selected.png')
                                : AssetImage(
                                    'assets/images/icons/curriculum.png'),
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: CircleAvatar(
                            radius: 25.0,
                            backgroundImage: _selectedTopBarIndex == 2
                                ? AssetImage(
                                    'assets/images/icons/school-life_selected.png')
                                : AssetImage(
                                    'assets/images/icons/school-life.png'),
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: CircleAvatar(
                            radius: 25.0,
                            backgroundImage:
                                AssetImage('assets/images/icons/sgsis.png'),
                          ),
                          label: '',
                        ),
                      ],
                      currentIndex: _selectedTopBarIndex,
                      onTap: _onTopNavbarTapped,
                    ),
                  ),
                ),
              ),
              Container(
                child: Expanded(child: checkviewpage(_selectedTopBarIndex)),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButtons(),
    );
  }

  Widget checkviewpage(selectedTopBarIndex) {
    switch (selectedTopBarIndex) {
      case 1:
        return Curriculum();
        break;
      case 0:
        return News();
        break;
      case 2:
        return SchoolLife();
        break;

      default:
        return Center(
            child: Text(
          'NULL',
          style: TextStyle(fontSize: 45),
        ));
        break;
    }
  }

  void _onTopNavbarTapped(int index) async {
    if (index == 3) {
      const url = 'https://sgstar.edu.vn';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
      return null;
    }
    setState(() {
      _selectedTopBarIndex = index;
    });
  }
}
