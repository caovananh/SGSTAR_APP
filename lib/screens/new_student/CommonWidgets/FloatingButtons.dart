import 'package:flutter/material.dart';
import 'package:infixedu/screens/login/login_new.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class FloatingButtons extends StatefulWidget {
  const FloatingButtons({Key key}) : super(key: key);

  @override
  _FloatingButtonsState createState() => _FloatingButtonsState();
}

class _FloatingButtonsState extends State<FloatingButtons> {
  String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
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
      ],
    );
  }

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', null);

    setState(() {
      name = '';
    });
  }


}