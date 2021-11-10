import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/studentScreen/ActivityWidget/DetailActivity.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ActivityWidget/AddActivity.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({key}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  List<dynamic> listTeacher;
  List<dynamic> listNews;
  bool hasData = false;
  String teacherPhoto;
  Future<void> _launched;

  void initState() {
    this.getNewsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(5, (index) => null);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget(),
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     DropdownButton<String>(
              //       items: <String>['Grade 1', 'Grade 2', 'Grade 3', 'Grade 4']
              //           .map((String value) {
              //         return DropdownMenuItem<String>(
              //           value: value,
              //           child: Text(value),
              //         );
              //       }).toList(),
              //       hint: Text("All Grades"),
              //       onChanged: (_) {},
              //     ),
              //     SizedBox(
              //       width: 30,
              //     ),
              //     DropdownButton<String>(
              //       items: <String>['Grade 1', 'Grade 2', 'Grade 3', 'Grade 4']
              //           .map((String value) {
              //         return DropdownMenuItem<String>(
              //           value: value,
              //           child: Text(value),
              //         );
              //       }).toList(),
              //       hint: Text("All Subjects"),
              //       onChanged: (_) {},
              //     ),
              //     SizedBox(
              //       width: 30,
              //     ),
              //     IconButton(onPressed: null, icon: Icon(Icons.search))
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Activities',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                StoreActivity()),
                      );

                    }, icon: Icon(Icons.add),color: Colors.black,)
                  ],
                ),
              ),
              Container(
                height: 300,
                child: FutureBuilder(
                  future: this.getNewsList(),
                  builder: (context,data){
                    if(data.hasData)
                      {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listNews!=null?listNews.length:1,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 5.0, right: 5.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailActivity(id: listNews[index]['id'])),
                                  );
                                },
                                child: Container(
                                  width: 170,
                                  height: 300,
                                  decoration: new BoxDecoration(
                                      image: DecorationImage(
                                        image:  NetworkImage("https://sgstar.asia/" +listNews[index]['image']),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: new BorderRadius.circular(16.0),
                                      color: Color(0xffe1f0ec)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(bottom: 15, right: 10),
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            height: 30,
                                            width: 140,
                                            decoration: BoxDecoration(
                                                borderRadius: new BorderRadius.only(
                                                    topRight: Radius.circular(40.0),
                                                    bottomRight: Radius.circular(40.0)),
                                                color: Color(0xFF7dd3f7)),
                                            child: Center(
                                              child: Text(
                                                listNews[index]['news_title'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    else
                      return Container(
                          color: Colors.white,
                          child: Center(child: CircularProgressIndicator()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'My Collections  (0)',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 250,
                      height: 50,
                      child: TextField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText:
                                'Create new collection to organize your....'),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: OutlinedButton(
                      onPressed: null,
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                      ),
                      child: const Text("Create"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )));
  }

  Future<void> _openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<String> getNewsList() async {
    final pref = await SharedPreferences.getInstance();
    String classId = pref.get('class_id');
    String userId = pref.get('id');
    String rule = pref.get('rule');

    final response = await http.get(Uri.parse(InfixApi.getActivities()));
    Map<String, dynamic> map = json.decode(response.body);
    setState(() {
      listNews = map["data"]["news"];
      hasData = true;
    });
    //print(listNews);
    return "Success!";
  }
}
