import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarMainScreen.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/CardHeader.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:infixedu/utils/apis/Apis.dart';

class Contact extends StatefulWidget {
  const Contact({key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  List<dynamic> listTeacher;
  Future<void> _launched;

  @override
  void initState() {
    this.getTeacher();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget(),
        body: Column(
          children: [
            CardHeader(
                child: Text(
              'Contact'.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
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
                    itemCount: listTeacher == null ? 0 : listTeacher.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              height: 140,
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
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: const Color(0xff7cd3f7),
                                        ),
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: Image.asset(
                                        'assets/images/icons/student1.png'),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listTeacher[index]['full_name'],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.fade,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Subject name: " +
                                          listTeacher[index]['subject_name']),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Read more',
                                        style: TextStyle(
                                            color: Color(0xff13438f),
                                            fontStyle: FontStyle.italic),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              launch("tel://" +
                                                  listTeacher[index]['mobile']);
                                            },
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              child: Image.asset(
                                                  'assets/images/icons/call.png'),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _launched = _openUrl('sms:' +
                                                    listTeacher[index]
                                                        ['mobile']);
                                              });
                                            },
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              child: Image.asset(
                                                  'assets/images/icons/chatgreen.png'),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _launched = _openUrl('mailto:' +
                                                    listTeacher[index]
                                                        ['email']);
                                              });
                                            },
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              child: Image.asset(
                                                  'assets/images/icons/mailbox.png'),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    })),
          ],
        ));
  }

  Future<String> getTeacher() async {
    final pref = await SharedPreferences.getInstance();
    String idUser = pref.get('StudentId');
    final response =
        await http.get(Uri.parse(InfixApi.getTeacherList(int.parse(idUser))));
    Map<String, dynamic> map = json.decode(response.body);
    setState(() {
      listTeacher = map["data"]["teacher_list"];
    });
    print(listTeacher);

    return "Success!";
  }

  Future<void> _openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
