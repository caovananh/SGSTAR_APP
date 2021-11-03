import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/studentScreen/Skill/EditSkill.dart';
import 'package:infixedu/screens/new_student/studentScreen/note_detail.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Skill extends StatefulWidget {
  const Skill({key}) : super(key: key);
  @override
  _SkillState createState() => _SkillState();
}

class _SkillState extends State<Skill> {
  List<dynamic> listSkill;
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body:
      FutureBuilder(
          future: getListSkill(),
          builder: (context, data) {
            if (data.hasData) {
              return ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height*0.075,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        color: Color(0xFF9EDEFF),
                        borderRadius: BorderRadius.circular(
                          45.0,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'SKILL CHART',
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFF144385),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Name',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Communication',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Developing',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Independence',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Identity',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Edit',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                        rows: listSkill.map(
                            (skillData) =>DataRow(
                              cells: <DataCell>[
                                DataCell(Text(skillData['full_name'])),
                                DataCell(Text(skillData['communication'])),
                                DataCell(Text(skillData['developing'])),
                                DataCell(Text(skillData['independence'])),
                                DataCell(Text(skillData['identity'])),
                                DataCell( IconButton(
                                  icon:  Icon(Icons.edit_sharp),
                                  color: Colors.black,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FixSkill(id: skillData['student_id'].toString(),)),
                                    );

                                  },
                                ),),
                              ],
                            ),
                        ).toList(),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return Container(
                  color: Colors.white,
                  child: Center(child: CircularProgressIndicator()));
            }
          }),

    );
  }

  Future<String> getListSkill() async{
    final pref = await SharedPreferences.getInstance();
    String idUser = pref.get('id');
    final response = await http.get(Uri.parse(InfixApi.getStudentSkill(int.parse(idUser))));
    Map<String, dynamic> map = json.decode(response.body);
    setState(() {
      listSkill = map["data"]["students"];
    });
    //print(listSkill);

    return "Success!";
  }
}