import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/studentScreen/Widgets/HomeWorkDetail.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;


class HomeWorkList extends StatefulWidget {
  const HomeWorkList({key}) : super(key: key);

  @override
  _HomeWorkListState createState() => _HomeWorkListState();
}

class _HomeWorkListState extends State<HomeWorkList> {
  final items = List<String>.generate(1, (i) => "Item $i");
  List<dynamic> listHomework;
  @override
  void initState() {
    getHomeWork();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: ListView.builder(
        itemCount: listHomework==null?0:listHomework.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: InkWell(
              onTap: () {
                pushNewScreen(
                  context,
                  screen: HomeWorkDetail(),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              child: Card(
                color: Color(0xffebf6ff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                    contentPadding: EdgeInsets.only(left: 0.0),
                    isThreeLine: true,
                    leading: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF7dd3f7),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        ),
                      ),
                      width: 35,
                      height: 30,
                      child: Center(
                          child: Text(
                            (index+1).toString(),
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                    ),
                    title: Text('Subject: Homework '+(index+1).toString()),
                    subtitle: Column(
                      children: <Widget>[
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Time: '+listHomework[index]['submission_date'])),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Content: '+listHomework[index]['description'])
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Score: '+listHomework[index]['marks'])
                        ),
                      ],
                    )),
              ),
            ),
          );
        },
      ),
    );
    
  }
  Future<String> getHomeWork() async{
    final pref = await SharedPreferences.getInstance();
    String classId = pref.get('class_id');
    var id = classId;
    final response = await http.get(Uri.parse(InfixApi.getHomeWorkClass(int.parse(classId))));
    Map<String, dynamic> map = json.decode(response.body);
    setState(() {
      listHomework = map["data"]["homeworkLists"];
    });
    print(listHomework);

    return "Success!";
  }
}