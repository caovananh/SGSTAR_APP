import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/studentScreen/Notification/SendNotification.dart';
import 'package:infixedu/screens/new_student/studentScreen/note_detail.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FixSkill extends StatefulWidget {
  final id;

  const FixSkill({key, this.id}) : super(key: key);

  @override
  _FixSkillState createState() => _FixSkillState();
}

class _FixSkillState extends State<FixSkill> {
  String skill_1;
  String skill_2;
  String skill_3;
  String skill_4;
  bool hasData = false;
  bool isSending = false;

  @override
  void initState() {
    this.getStudentSkill();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBarWidget(),
        body: skill_1 != null
            ? Padding(
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 30.0, left: 20.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    border: Border.all(
                      color: Color(0xFF9EDEFF),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15.0,
                          ),
                          Text('Skill 1'),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextField(
                            // controller: _controllerInputSkill1,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: skill_1 != null ? skill_1 : 'Skill 1',
                            ),
                            onChanged: (text) {
                              skill_1 = text;
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text('Skill 2'),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextField(
                            // controller: _controllerInputSkill2,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: skill_2 != null ? skill_2 : 'Skill 2',
                            ),
                            onChanged: (text) {
                              skill_2 = text;
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text('Skill 3'),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextField(
                            // controller: _controllerInputSkill3,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: skill_3 != null ? skill_3 : 'Skill 3',
                            ),
                            onChanged: (text) {
                              skill_3 = text;
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text('Skill 4'),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextField(
                            // controller: _controllerInputSkill4,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: skill_4 != null ? skill_4 : 'Skill 4',
                            ),
                            onChanged: (text) {
                              skill_4 = text;
                            },
                          ),
                          SizedBox(
                            height: 75.0,
                          ),
                          Center(
                              child: Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(fontSize: 24),
                                  maximumSize: Size.fromHeight(72),
                                  shape: StadiumBorder()),
                              onPressed: () async {
                                print('ok');
                                storeStudentSkill();
                                if (isSending) return;
                                setState(() {
                                  isSending = true;
                                });
                                await Future.delayed(Duration(seconds: 60));
                                print('ok');
                              },
                              child: isSending
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            )),
                                        const SizedBox(
                                          width: 24,
                                        ),
                                        Text('Please Wait...')
                                      ],
                                    )
                                  : Text('Save'),
                            ),
                          )
                              // OutlinedButton.icon(
                              //   onPressed: () {
                              //     storeStudentSkill();
                              //     print('ok');
                              //   },
                              //   label: Text('Save'),
                              //   icon: Icon(Icons.edit_sharp),
                              // ),
                              )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator())));
  }

  Future<void> getStudentSkill() async {
    final pref = await SharedPreferences.getInstance();
    int id = int.parse(widget.id);
    final response =
        await http.get(Uri.parse(InfixApi.getStudentSkillDetail(id)));
    var jsonData = json.decode(response.body);
    print(jsonData);
    if (mounted) {
      setState(() {
        skill_1 = jsonData['data']['skill']['communication'];
        skill_2 = jsonData['data']['skill']['developing'];
        skill_3 = jsonData['data']['skill']['independence'];
        skill_4 = jsonData['data']['skill']['identity'];
        hasData = true;
      });
    }
  }

  Future<void> storeStudentSkill() async {
    final pref = await SharedPreferences.getInstance();
    String idUser = pref.get('id');

    final response = await http.get(Uri.parse(InfixApi.storeStudentSkill(
        int.parse(widget.id),
        int.parse(skill_1),
        int.parse(skill_2),
        int.parse(skill_3),
        int.parse(skill_4))));
    Navigator.pop(context);
  }
}
