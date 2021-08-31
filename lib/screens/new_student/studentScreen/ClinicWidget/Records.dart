import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({key}) : super(key: key);
  @override
  _RecordScreenState createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  String id;
  final items = List<String>.generate(10, (i) => "Item $i");
  List<dynamic> listReport;
  @override
  void initState() {
    this.getReport();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: ListView.builder(
        itemCount: listReport==null?0:listReport.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
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
                    title: Text("Case: "+listReport[index]['case'],),
                    subtitle: Column(
                      children: <Widget>[
                        SizedBox(height: 5,),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Date: " + listReport[index]['date'])),
                        SizedBox(height: 5,),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Temperaturte: ' + listReport[index]['temperaturte']+"oC")),
                        SizedBox(height: 5,),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Respiratory: ' + listReport[index]['respiratory'])
                        ),
                        SizedBox(height: 5,),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Symtome_type: ' +  listReport[index]['symtome_type'])
                        ),
                        SizedBox(height: 5,),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Symtome describe: ' +  listReport[index]['symtome_describe'])
                        ),
                      ],
                    )),
              ),
          );
        },
      ),
    );
  }

  Future<String> getReport() async{
    final pref = await SharedPreferences.getInstance();
    String idUser = pref.get('StudentId');
    id = idUser;
    final response = await http.get(Uri.parse(InfixApi.getReport(int.parse(id))));
    Map<String, dynamic> map = json.decode(response.body);
    setState(() {
      listReport = map["data"]["ReportMedical"];
    });
    print(listReport);

    return "Success!";
  }
}