import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BlockUser extends StatefulWidget {
  final int id;

  const BlockUser({key, this.id}) : super(key: key);

  @override
  _BlockUserState createState() => _BlockUserState();
}

class _BlockUserState extends State<BlockUser> {
  bool isSending = false;
  bool hasData = false;
  Future myFuture;
  String dropdownValue;
  List<dynamic> studentList;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 35,),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              child: new Text(
                "block user".toUpperCase(),
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
            SizedBox(height: 35,),
            FutureBuilder(
              future: this.getTeacherStudent(),
              builder: (context,data){
                if(data.hasData)
                {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Color(0xff7cd3f7), width: 2)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                                print(dropdownValue);
                              });
                            },
                            items: studentList.map((item) {
                              return DropdownMenuItem<String>(
                                value: item['user_id'].toString(),
                                child: Text(item['full_name']),
                              );
                            }).toList(),
                            hint: Text(
                              "Select student name",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                else
                  return Container(
                      color: Colors.white,
                      child: Center(child: CircularProgressIndicator()));
              },
            ),

            SizedBox(height: 35,),
            Padding(
              padding: EdgeInsets.only(left: 20.0,right: 20.0),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 24),
                    maximumSize: Size.fromHeight(80),
                    shape: StadiumBorder(),
                  ),
                  onPressed: () async{
                    print('ok');
                    // storeStudentSkill();
                    if(isSending) return;
                    setState(() {
                      isSending=true;
                    });
                    await Future.delayed(Duration(seconds: 60));
                    print('ok');
                  },
                  child: isSending ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(color: Colors.white,)),
                      const SizedBox(width: 24,),
                      Text('Please Wait...')
                    ],
                  ) : Text('Save'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<String> getTeacherStudent() async {
    final pref = await SharedPreferences.getInstance();
    String userId = pref.get('id');

    final response = await http
        .get(Uri.parse(InfixApi.getTeacherStudent(int.parse(userId))));
    Map<String, dynamic> map = json.decode(response.body);
    setState(() {
      studentList = map["data"]["students"];
      hasData = true;
    });
    return "Success!";
  }
}
