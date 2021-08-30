import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarMainScreen.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/CardHeader.dart';

class Contact extends StatefulWidget {
  const Contact({key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final items = List<String>.generate(10, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: CardHeader(
                  child: Text(
                'Contact'.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            BorderSide(color: Color(0xff7cd3f7), width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            BorderSide(color: Color(0xff7cd3f7), width: 2)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xff13438f),
                      size: 30,
                    ),
                    labelText: 'search'.toUpperCase(),
                    labelStyle: TextStyle(color: Color(0xff13438f))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0xff7cd3f7), width: 2))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: const Color(0xff7cd3f7),
                                  ),
                                  shape: BoxShape.circle,
                                  color: Colors.white),
                              child:
                                  Image.asset('assets/images/icons/student1.png'),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tên giáo viên',
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w700),
                                ),
                                Text('GVCN Year 1N'),
                                Text('GV Toán Year 1N'),
                                Text('GV Bơi Year 1N'),
                                Text(
                                  'Read more',
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontStyle: FontStyle.italic),
                                )
                              ],
                            ),
                            SizedBox(width: 10),
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child:
                                      Image.asset('assets/images/icons/call.png'),
                                ),
                                Container(
                                  width: 50,
                                  height: 50,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Image.asset(
                                      'assets/images/icons/chatgreen.png'),
                                ),
                                Container(
                                  width: 50,
                                  height: 50,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Image.asset(
                                      'assets/images/icons/mailbox.png'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
