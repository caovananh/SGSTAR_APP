import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/BusScreen/BusScreen.dart';
import 'package:infixedu/screens/new_student/ChatScreen/ChatScreen.dart';
import 'package:infixedu/screens/new_student/ELearningScreen/ElearningScreen.dart';
import 'package:infixedu/screens/new_student/HomeScreen/HomeScreen.dart';
import 'package:infixedu/screens/new_student/SettingScreen/SettingsScreen.dart';
import 'package:infixedu/screens/new_student/studentScreen/StudentScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeStudent extends StatefulWidget {
  var _titles;
  var _images;

  HomeStudent(this._titles, this._images);

  @override
  _HomeStudentState createState() => _HomeStudentState();
}

class _HomeStudentState extends State<HomeStudent> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      StudentScreen(),
      ChatScreen(),
      BusScreen(),
      ELearningScreen(),
      SettingScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage('assets/images/icons/home.png'),
          size: 35,
        ),
        activeColorPrimary: Color(0xff191970),
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage('assets/images/icons/student.png'),
          size: 35,
        ),
        activeColorPrimary: Color(0xff191970),
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage('assets/images/icons/chat.png'),
          size: 35,
        ),
        activeColorPrimary: Color(0xff191970),
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage('assets/images/icons/bus.png'),
          size: 35,
        ),
        activeColorPrimary: Color(0xff191970),
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage('assets/images/icons/elearning.png'),
          size: 35,
        ),
        activeColorPrimary: Color(0xff191970),
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage('assets/images/icons/setting.png'),
          size: 35,
        ),
        activeColorPrimary: Color(0xff191970),
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Color(0xFF7dd3f7),
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style12, // Choose the nav bar style with this property.
    );
  }
}
