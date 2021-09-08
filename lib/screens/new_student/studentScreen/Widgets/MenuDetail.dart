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

class MenuDetail extends StatefulWidget {
  final String day;
  const MenuDetail({Key key, this.day}) : super(key: key);


  @override
  _MenuDetailState createState() => _MenuDetailState();
}

class _MenuDetailState extends State<MenuDetail> {
  final items = List<String>.generate(5, (i) => "Item $i");
  List<dynamic> hotDishes;
  List<dynamic> vegetarian;
  List<dynamic> salad;
  List<dynamic> hams;
  List<dynamic> desserts;
  List<dynamic> snack;
  var date = DateTime.now();
  String dayWeek;
  String id;
  Timer timer;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  Future<String> getTodayMenu;
  @override
  void initState() {
    setTime();
    getTodayMenu=getMenu(widget.day.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getTodayMenu,
        builder: (context,data){
          if(data.hasData){
            return Container(
              color: Colors.white,
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
                                        itemCount: hotDishes == null ? 0 : hotDishes
                                            .length,
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
                                      itemCount: vegetarian == null ? 0 : vegetarian
                                          .length,
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
                                      itemCount: salad == null ? 0 : salad.length,
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
                                      itemCount: hams == null ? 0 : hams.length,
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
                                      itemCount: snack == null ? 0 : snack.length,
                                      itemBuilder: (context, index) {
                                        return Center(
                                            child: Text(snack[index]["name"]));
                                      }),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()));
          }
    });
  }
  void setTime() async{
    final pref = await SharedPreferences.getInstance();
    pref.setString('weekday', dateFormat.format(date));
  }
  Future<String> getMenu(String dayweek) async{

    final pref = await SharedPreferences.getInstance();
    String weekday = pref.get('weekday');
    //print(DateFormat('EEEE').format(dateFormat.parse(weekday)));
    //DateFormat('EEEE').format(dateFormat.parse(weekday))==null?dayWeek=DateFormat("EEEE").format(date):dayWeek=DateFormat('EEEE').format(dateFormat.parse(weekday));
    dayWeek=dayweek;
    print(dayweek);
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
    pref.setString('weekday', dateFormat.format(date));
    print(dateFormat.format(date));
    print(hotDishes);
    print(vegetarian);
    print(salad);
    print(hams);
    print(snack);
    return "Success!";
  }
}