import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({key}) : super(key: key);

  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  final items = List<String>.generate(10, (i) => "Item $i");
  List<dynamic> listSubjectTeacher;
  void initState() {
    this.getSubject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: Container(
                width: double.infinity,
                child: new Text(
                  "subject".toUpperCase(),
                  style: new TextStyle(
                    color: Color(0Xff13438f),
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
                  color: Color(0xff7cd3f7),
                ),
                padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "subject list".toUpperCase(),
              style: new TextStyle(
                color: Color(0Xff13438f),
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(left: 20.0,right: 20.0),
                itemCount: listSubjectTeacher==null?0:listSubjectTeacher.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                          color: Color(0xff7cd3f7),
                          width: 2.0,
                        ),
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(listSubjectTeacher[index]['subject_name'], style: TextStyle(fontSize: 15)),
                          Text(listSubjectTeacher[index]['full_name'], style: TextStyle(fontSize: 15))
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Future<String> getSubject() async {
    final pref = await SharedPreferences.getInstance();
    String idUser = pref.get('StudentId');
    final response =
    await http.get(Uri.parse(InfixApi.getSubjectTeacher(int.parse(idUser))));
    Map<String, dynamic> map = json.decode(response.body);
    setState(() {
      listSubjectTeacher = map["data"]["subject"];
    });
    print(listSubjectTeacher);

    return "Success!";
  }
}
