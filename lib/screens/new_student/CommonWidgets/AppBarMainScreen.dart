import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/Logout.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;

class AppBarMainScreen extends StatefulWidget implements PreferredSizeWidget {
  const AppBarMainScreen({Key key}) : super(key: key);
  Size get preferredSize => const Size.fromHeight(100);
  @override
  _AppBarMainScreenState createState() => _AppBarMainScreenState();
}

class _AppBarMainScreenState extends State<AppBarMainScreen> {
  String name;
  String id;
  String userPhoto;
  @override
  void initState() {
    getParentInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          primary: false,
          centerTitle: false,
          title: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      // onTap: () => showDialog<String>(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return AlertDialog(
                      //         content: SingleChildScrollView(
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: <Widget>[
                      //           TextButton(
                      //               onPressed: () {
                      //                 _logout();
                      //               },
                      //               child: Text(
                      //                 'Logout',
                      //                 style: TextStyle(fontSize: 25),
                      //               )),
                      //         ],
                      //       ),
                      //     ));
                      //   },
                      // ),
                      child: CircleAvatar(
                        radius: 35.0,
                        backgroundImage:
                        userPhoto!=null?NetworkImage('https://sgstar.asia/'+ userPhoto.toString()):AssetImage('assets/images/icons/student1.png'),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              getName() != null ? getName() : 'null',
                              style: TextStyle(
                                  color: const Color(0xff07509d),
                                  fontSize: 23.0),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          flexibleSpace: Image(
            image: AssetImage('assets/images/tool_bar_bg.png'),
            fit: BoxFit.fill,
            height: 100.0,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ));
  }

  String getName() {
    Utils.getStringValue('full_name').then((value) {
      setState(() {
        name = value;
      });
    });
    return name;
  }

  Future<String> getParentInfo() async {
    final pref = await SharedPreferences.getInstance();
    String remember = pref.get('StudentId');
    id = remember;
    String userId=pref.get('id');
    String rule=pref.get('rule');

    if(int.parse(rule)==2)
    {
      final response =
      await http.get(Uri.parse(InfixApi.getStudentInfo(int.parse(id))));
      var jsonData = json.decode(response.body);
      //print(jsonData['data']['student_detail']);
      if (mounted) {
        setState(() {
          userPhoto = jsonData['data']['student_detail']['student_photo'];
        });
      }
    }
    else if(int.parse(rule)==4)
    {
      final response =
      await http.get(Uri.parse(InfixApi.getTeacherInfo(int.parse(userId))));
      var jsonData = json.decode(response.body);
      //print(jsonData['data']['student_detail']);
      if (mounted) {
        setState(() {
          userPhoto = jsonData['data']['teacher']['staff_photo'];
        });
      }
    }
    return "Success!";
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
