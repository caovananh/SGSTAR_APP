import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;

class FloatingChat extends StatefulWidget {
  const FloatingChat({Key key}) : super(key: key);

  @override
  _FloatingChatState createState() => _FloatingChatState();
}

class _FloatingChatState extends State<FloatingChat> {
  bool hasData = false;
  List<dynamic> studentList;
  String name;
  String _chosenValue;
  List<String> student_List = [];
  @override
  void initState() {
    this.getStudentList();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            heroTag: Text("btn1"),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                "assets/images/icons/btn.png",
              ),
              backgroundColor: Colors.white,
            ),
            onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(width: 3, color: Color(0xFF9EDEFF))),
                      title: Text(
                        'New Conversation',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: Container(
                        height: 200,
                        width: 300,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: _chosenValue,
                                  underline: Container(),
                                  items: student_List.map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(
                                        value,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    );
                                  }).toList(),
                                  hint: Text("Select item"),
                                  menuMaxHeight: 400,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      _chosenValue = newValue;
                                      print(newValue);
                                    });
                                  },
                                ),
                              ),
                            ),
                            Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(
                                        color: Color(0xff7cd3f7), width: 2.0)),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10, left: 15),
                                  child: TextField(
                                    style: TextStyle(color: Colors.black45),
                                    maxLines: 6,
                                    decoration: InputDecoration.collapsed(
                                        hintText: "Content",
                                        hintStyle: TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0xffd8d8d8))),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Yes'),
                          child: Center(
                            child: Text(
                              'apply'.toUpperCase(),
                              style: TextStyle(color: Color(0xFF9EDEFF)),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
                }),
          ),
        ),
      ],
    );
  }

  Future<String> getStudentList() async {
    final response = await http.get(Uri.parse(InfixApi.getStudentList()));
    Map<String, dynamic> map = json.decode(response.body);
    setState(() {
      studentList = map["data"]["Student_List"];
      hasData = true;
    });
    for (int i = 0; i < studentList.length; i++) {
      student_List.add(studentList[i]["full_name"]);
    }
    print(student_List);
    return "Success!";
  }
}
