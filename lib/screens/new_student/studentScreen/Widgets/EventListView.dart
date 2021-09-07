import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EventListView extends StatefulWidget {
  const EventListView({key}) : super(key: key);

  @override
  _EventListViewState createState() => _EventListViewState();
}

class _EventListViewState extends State<EventListView> {
  final items = List<String>.generate(10, (i) => "Item $i");
  List<dynamic> eventList;
  int i = 0;
  void initState() {
    getEventList();
    super.initState();
    print(items);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: ListView.builder(
        itemCount: eventList==null?0:eventList.length,
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
                  title: Text(eventList[index]['event_title']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Start: "+eventList[index]['from_date']),
                      SizedBox(height: 10,),
                      Text("End: "+eventList[index]['to_date'])
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }

  Future<String> getEventList() async{

    final response = await http.get(Uri.parse(InfixApi.getEvents()));
    Map<String, dynamic> map = json.decode(response.body);
    setState(() {
      eventList = map["data"]["events"];
    });
    print(eventList);

    return "Success!";
  }
}
