import 'package:flutter/material.dart';
import 'package:infixedu/utils/Utils.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({key}) : super(key: key);
  Size get preferredSize => const Size.fromHeight(60);
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF7dd3f7),
      automaticallyImplyLeading: true,
      leading: Center(
        child: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.navigate_before_outlined,
            size: 40,
            color: Color(0xff07509d),
          ),
        ),
      ),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 8),
              child: CircleAvatar(
                radius: 17.0,
                backgroundImage: AssetImage('assets/images/icons/student1.png'),
                backgroundColor: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_outlined,
                size: 40,
                color: Color(0xff07509d),
              ),
            ),
          ],
        )
      ],
    );
  }
}
