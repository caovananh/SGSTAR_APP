import 'package:flutter/material.dart';
import 'package:infixedu/utils/Utils.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({key}) : super(key: key);
  Size get preferredSize => const Size.fromHeight(100);
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  String name;
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
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage:
                          AssetImage('assets/images/icons/student1.png'),
                      backgroundColor: Colors.white,
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
}
