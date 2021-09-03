import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({key}) : super(key: key);
  @override
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  List<dynamic> listTeacher;
  String teacherPhoto;
  Future<void> _launched;
  void initState() {
    this.getTeacher();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(5, (index) => null);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget(),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20,top: 20.0),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    child: new Text(
                      "teacher contact".toUpperCase(),
                      style: new TextStyle(
                        color: Color(0Xff13438f),
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    decoration: new BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(30.0)),
                      color: Color(0xff7cd3f7),
                    ),
                    padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                  ),
                ),
              ),
              SizedBox(height: 25),
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
             // Expanded(child: TextButton(
             //   child: Text("test"),
             //   onPressed: () {
             //     getTeacher();
             //   },
             // )),
              Expanded(
                  child: ListView.builder(
                      itemCount: listTeacher==null?0:listTeacher.length,
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
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color: const Color(0xff7cd3f7),
                                          ),
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: CircleAvatar(
                                        backgroundImage: listTeacher[index]['staff_photo']!=null?NetworkImage('https://sgstar.asia/'+ listTeacher[index]['staff_photo'].toString()):AssetImage('assets/images/icons/student1.png'),
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(listTeacher[index]['full_name'],
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.fade,),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Subject name: "+listTeacher[index]['subject_name']),
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
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap:(){
                                                launch("tel://"+listTeacher[index]['mobile']);
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
                                              width: MediaQuery.of(context).size.width*0.15,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _launched = _openUrl('sms:' + listTeacher[index]['mobile']);
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
                                              width: MediaQuery.of(context).size.width*0.15,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _launched = _openUrl('mailto:' + listTeacher[index]['email']);
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
          ),
        ));
  }
  Future<String> getTeacher() async{
    final pref = await SharedPreferences.getInstance();
    String idUser = pref.get('StudentId');
    final response = await http.get(Uri.parse(InfixApi.getTeacherList(int.parse(idUser))));
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
