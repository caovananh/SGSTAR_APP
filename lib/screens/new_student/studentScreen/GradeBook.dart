import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';

import 'package:infixedu/screens/new_student/CommonWidgets/week_new_calendar.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/year_calendar.dart';
import 'package:infixedu/utils/Utils.dart';

class GradeBookScreen extends StatefulWidget {
  const GradeBookScreen({key}) : super(key: key);
  @override
  _GradeBookScreenState createState() => _GradeBookScreenState();
}

class _GradeBookScreenState extends State<GradeBookScreen>
    with SingleTickerProviderStateMixin {
  bool _checkbox = false;
  String name;
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(_handleTabSelection);
    super.initState();
    name = getName();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Center(
              child: Container(
                width: double.infinity,
                child: new Text(
                  "GRADE BOOK",
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
            Container(
              padding: EdgeInsets.only(top: 10),
              child: DefaultTabController(
                  length: 3,
                  child: TabBar(
                    labelPadding: EdgeInsets.all(0),
                    controller: _tabController,
                    indicatorColor: Color(0xff7cd3f7),
                    tabs: [
                       Container(
                        width:  MediaQuery. of(context). size. width,
                        child: Tab(
                          child: Text(
                            "WEEKLY SCORES",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff13438f),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),

                       Container(
                        width:  MediaQuery. of(context). size. width,
                        child: Tab(
                          child: Text(
                            "SUBJECT SCORES",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff13438f),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                     
                      Container(
                        width:  MediaQuery. of(context). size. width,
                        child: Tab(
                          child: Text(
                            "PROGRESS REPORTS",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff13438f),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                     
                    ],
                  )),
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [
                ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Week2CalendarWidget(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
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
                                '1',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              )),
                            ),
                            title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Subject",
                                    style: TextStyle(
                                        color: Color(0xff13438f),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text('25/12/2021',style: TextStyle(color: Colors.grey,fontSize: 14),),
                                  )
                                ],
                              ),
                            subtitle: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. ')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 30),
                                          child: Text(
                                            'Score:',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        Text(
                                          '200-400',
                                          style: TextStyle(
                                              color: Color(0xff7cd3f7),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),),
                                )
                              ],
                            )),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
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
                                '1',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              )),
                            ),
                            title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Subject",
                                    style: TextStyle(
                                        color: Color(0xff13438f),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text('25/12/2021',style: TextStyle(color: Colors.grey,fontSize: 14),),
                                  )
                                ],
                              ),
                            subtitle: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. ')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 30),
                                          child: Text(
                                            'Score:',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        Text(
                                          '200-400',
                                          style: TextStyle(
                                              color: Color(0xff7cd3f7),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),),
                                )
                              ],
                            )),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
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
                                '1',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              )),
                            ),
                            title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Subject",
                                    style: TextStyle(
                                        color: Color(0xff13438f),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text('25/12/2021',style: TextStyle(color: Colors.grey,fontSize: 14),),
                                  )
                                ],
                              ),
                            subtitle: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. ')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 30),
                                          child: Text(
                                            'Score:',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        Text(
                                          '200-400',
                                          style: TextStyle(
                                              color: Color(0xff7cd3f7),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),),
                                )
                              ],
                            )),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
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
                                '1',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              )),
                            ),
                            title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Subject",
                                    style: TextStyle(
                                        color: Color(0xff13438f),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text('25/12/2021',style: TextStyle(color: Colors.grey,fontSize: 14),),
                                  )
                                ],
                              ),
                            subtitle: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. ')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 30),
                                          child: Text(
                                            'Score:',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        Text(
                                          '200-400',
                                          style: TextStyle(
                                              color: Color(0xff7cd3f7),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),),
                                )
                              ],
                            )),
                      ),
                    ),
                  
                  ],
                ),
                ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25,right: 25, bottom: 15),
                      child: Container(
                        width:  MediaQuery. of(context). size. width,
                        height: 65,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                          color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(Colors.blue),
                              ),
                              onPressed: () {
                                null;
                              },
                              child: Text('<',
                                  style:
                                      TextStyle(color: Color(0xff07509d), fontSize: 24)),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(Colors.blue),
                              ),
                              onPressed: () {},
                              child: Text(
                                'english'.toUpperCase(),
                                style: TextStyle(
                                    color: Color(0xff07509d),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(Colors.blue),
                              ),
                              onPressed: () {
                                null;
                              },
                              child: Text('>',
                                  style:
                                      TextStyle(color: Color(0xff07509d), fontSize: 24)),
                            ),
                          ],
                        ),
                      ),
                    ), 
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            width: double.infinity,
                            height: 700,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffebf6ff),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(1,1)
                                ),
                              ],
                              ),
                            
                            child: Padding(

                              padding: const EdgeInsets.only(left: 10,top: 40,right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center, 
                                    children: [
                                      Text('25/12/2021'),
                                      Container(
                                        width: 220,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xff7cd3f7), width: 2),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                        ),

                                        child:  Padding(
                                          padding: const EdgeInsets.only(left:10,right: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Lorem Ipsum'),
                                              const Text(
                                                "200-400",
                                                style: TextStyle(
                                                color: Color(0xff7cd3f7),
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20),
                                              ),
                                              
                                            ],
                                          ),
                                        ),
                                        
                                        ),
                                        
                                    ],
                                  ),

                                  SizedBox(height: 20),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center, 
                                    children: [
                                      Text('25/12/2021'),
                                      Container(
                                        width: 220,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xff7cd3f7), width: 2),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                        ),

                                        child:  Padding(
                                          padding: const EdgeInsets.only(left:10,right: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Lorem Ipsum'),
                                              const Text(
                                                "200-400",
                                                style: TextStyle(
                                                color: Color(0xff7cd3f7),
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20),
                                              ),
                                              
                                            ],
                                          ),
                                        ),
                                        
                                        ),
                                        
                                    ],
                                  ),

                                  SizedBox(height: 20),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center, 
                                    children: [
                                      Text('25/12/2021'),
                                      Container(
                                        width: 220,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xff7cd3f7), width: 2),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                        ),

                                        child:  Padding(
                                          padding: const EdgeInsets.only(left:10,right: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Lorem Ipsum'),
                                              const Text(
                                                "200-400",
                                                style: TextStyle(
                                                color: Color(0xff7cd3f7),
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20),
                                              ),
                                              
                                            ],
                                          ),
                                        ),
                                        
                                        ),
                                        
                                    ],
                                  ),

                                  SizedBox(height: 20),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center, 
                                    children: [
                                      Text('25/12/2021'),
                                      Container(
                                        width: 220,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xff7cd3f7), width: 2),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                        ),

                                        child:  Padding(
                                          padding: const EdgeInsets.only(left:10,right: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Lorem Ipsum'),
                                              const Text(
                                                "200-400",
                                                style: TextStyle(
                                                color: Color(0xff7cd3f7),
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20),
                                              ),
                                              
                                            ],
                                          ),
                                        ),
                                        
                                        ),
                                        
                                    ],
                                  ),

                                  SizedBox(height: 20),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center, 
                                    children: [
                                      Text('25/12/2021'),
                                      Container(
                                        width: 220,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xff7cd3f7), width: 2),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                        ),

                                        child:  Padding(
                                          padding: const EdgeInsets.only(left:10,right: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Lorem Ipsum'),
                                              const Text(
                                                "200-400",
                                                style: TextStyle(
                                                color: Color(0xff7cd3f7),
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20),
                                              ),
                                              
                                            ],
                                          ),
                                        ),
                                        
                                        ),
                                        
                                    ],
                                  ),

                                  SizedBox(height: 20),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center, 
                                    children: [
                                      Text('25/12/2021'),
                                      Container(
                                        width: 220,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xff7cd3f7), width: 2),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                        ),

                                        child:  Padding(
                                          padding: const EdgeInsets.only(left:10,right: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Lorem Ipsum'),
                                              const Text(
                                                "200-400",
                                                style: TextStyle(
                                                color: Color(0xff7cd3f7),
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20),
                                              ),
                                              
                                            ],
                                          ),
                                        ),
                                        
                                        ),
                                        
                                    ],
                                  )
                                  
                                ],
                              ),
                            ),
                           
                          ),
                        ),
                        
                        Positioned(
                          left: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Container(
                              width: 2,
                              height: 500,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 91,
                          top: 60,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                        Positioned(
                          left: 95,
                          top: 64,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Color(0xff7cd3f7),
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                        Positioned(
                          left: 91,
                          top: 140,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                        Positioned(
                          left: 95,
                          top: 144,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Color(0xff7cd3f7),
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                        Positioned(
                          left: 91,
                          top: 220,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                        Positioned(
                          left: 95,
                          top: 224,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Color(0xff7cd3f7),
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                        Positioned(
                          left: 91,
                          top: 300,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                        Positioned(
                          left: 95,
                          top: 304,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Color(0xff7cd3f7),
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                        Positioned(
                          left: 91,
                          top: 380,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                        Positioned(
                          left: 95,
                          top: 384,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Color(0xff7cd3f7),
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                        Positioned(
                          left: 91,
                          top: 460,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                        Positioned(
                          left: 95,
                          top: 464,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Color(0xff7cd3f7),
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ],
                ),
                ListView(
                  children: [
                    YearCalendarWidget(),
                    Padding(
                      padding: const EdgeInsets.only(top: 30,left: 5,right: 5),
                      child: Container(
                      
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffebf6ff),
                          boxShadow: [
                            BoxShadow(color: Colors.grey),
                          ],
                        ),
                        child: GridView.count(
                          childAspectRatio: 3/2,
                          primary: false,
                          padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 40,
                          crossAxisCount: 2,
                          children: <Widget>[
                            Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xff7cd3f7), width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: const Text(
                                  "TERM 1",
                                  style: TextStyle(
                                      color: Color(0xff7cd3f7),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20),
                                ))),
                            Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xff7cd3f7), width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: const Text(
                                  "TERM 2",
                                  style: TextStyle(
                                      color: Color(0xff7cd3f7),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20),
                                ))),
                            Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xff7cd3f7), width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: const Text(
                                  "TERM 3",
                                  style: TextStyle(
                                      color: Color(0xff7cd3f7),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20),
                                ))),
                            Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xff7cd3f7), width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: const Text(
                                  "TERM 4",
                                  style: TextStyle(
                                      color: Color(0xff7cd3f7),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20),
                                ))),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  String getName() {
    Utils.getStringValue('full_name').then((value) {
      setState(() {
        name = value;
      });
    });
    return name;
  }
}
