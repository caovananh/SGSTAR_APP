import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/CustomCollapse.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/WeekCalendarWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;

class Menu extends StatefulWidget {
  const Menu({key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}
class _MenuState extends State<Menu> {
  final items = List<String>.generate(5, (i) => "Item $i");
  List<dynamic> hotDishes;
  List<dynamic> vegetarian;
  List<dynamic> salad;
  List<dynamic> hams;
  List<dynamic> desserts;
  List<dynamic> snack;
  var date = DateTime.now();
  String id;
  Timer timer;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  bool _expanded = false;
  @override
  void initState() {
    //timer = Timer.periodic(Duration(seconds: 4), (Timer t) => getMenu());
    getMenu();
    super.initState();
  }
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget(),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFF7dd3f7),
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ]),
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                        child: Text('MENU',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff07509d)))),
                  ),
                ),
              ),
              IconButton(onPressed: () {
                getMenu();
              }, icon: Icon(Icons.refresh),
                color: Colors.grey,),
              WeekCalendarWidget(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: CusTomCollapse(
                                title: Text('HOT DISHES'),
                                content: Row(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: hotDishes==null?0:hotDishes.length,
                                          itemBuilder: (context, index) {
                                            return Center(
                                                child: Text(hotDishes[index]["name"]));
                                          }),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: CusTomCollapse(
                              title: Text('VEGETARIAN'),
                              content: Row(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: vegetarian==null?0:vegetarian.length,
                                        itemBuilder: (context, index) {
                                          return Center(
                                              child: Text(vegetarian[index]["name"]));
                                        }),
                                  ),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: CusTomCollapse(
                              title: Text('Salad & vegetables'.toUpperCase()),
                              content: Row(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: salad==null?0:salad.length,
                                        itemBuilder: (context, index) {
                                          return Center(
                                              child: Text(salad[index]["name"]));
                                        }),
                                  ),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: CusTomCollapse(
                              title: Text('hams'.toUpperCase()),
                              content: Row(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: hams==null?0:hams.length,
                                        itemBuilder: (context, index) {
                                          return Center(
                                              child: Text(hams[index]["name"]));
                                        }),
                                  ),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: CusTomCollapse(
                              title: Text('Snack'.toUpperCase()),
                              content: Row(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: snack==null?0:snack.length,
                                        itemBuilder: (context, index) {
                                          return Center(
                                              child: Text(snack[index]["name"]));
                                        }),
                                  ),
                                ],
                              )),
                        ),
                        TextButton(onPressed: () {
                          getMenu();
                        }, child: Text("Test"))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
  void showTime() async{
    final pref = await SharedPreferences.getInstance();
    String idUser = pref.get('weekday');
    print(DateFormat('EEEE').format(dateFormat.parse(idUser)));
  }
  Future<String> getMenu() async{
    String dayWeek;
    final pref = await SharedPreferences.getInstance();
    String weekday = pref.get('weekday');

    DateFormat('EEEE').format(dateFormat.parse(weekday))==null?dayWeek=DateFormat("EEEE").format(date):dayWeek=DateFormat('EEEE').format(dateFormat.parse(weekday));
    //print(dayWeek);
    //final response = await http.get(Uri.parse(InfixApi.getMenu(DateFormat('EEEE').format(date))));
    final response_1 = await http.get(Uri.parse(InfixApi.getMenuType(dayWeek,1)));
    final response_2 = await http.get(Uri.parse(InfixApi.getMenuType(dayWeek,2)));
    final response_3 = await http.get(Uri.parse(InfixApi.getMenuType(dayWeek,3)));
    final response_4 = await http.get(Uri.parse(InfixApi.getMenuType(dayWeek,4)));
    final response_5 = await http.get(Uri.parse(InfixApi.getMenuType(dayWeek,5)));
    Map<String, dynamic> map_1 = json.decode(response_1.body);
    Map<String, dynamic> map_2 = json.decode(response_2.body);
    Map<String, dynamic> map_3 = json.decode(response_3.body);
    Map<String, dynamic> map_4 = json.decode(response_4.body);
    Map<String, dynamic> map_5 = json.decode(response_5.body);
    if (mounted){
      setState(() {
        hotDishes = map_1["data"]["Foods"];
        vegetarian = map_2["data"]["Foods"];
        salad = map_3["data"]["Foods"];
        hams = map_4["data"]["Foods"];
        snack = map_5["data"]["Foods"];
        
      });
    }
    dayWeek=DateFormat('EEEE').format(dateFormat.parse(weekday));
    print(hotDishes);
    print(vegetarian);
    print(salad);
    print(hams);
    print(snack);
    return "Success!";
  }
}
