import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/studentScreen/StudentInfoWidget/StudentInfo.dart';
import 'package:infixedu/screens/new_student/studentScreen/StudentInfoWidget/StudentInfoADM.dart';
import 'package:infixedu/utils/Utils.dart';

class StudentInfoPage extends StatefulWidget {
  const StudentInfoPage({key}) : super(key: key);

  @override
  State<StudentInfoPage> createState() => StudentInfoPageState();
}

class StudentInfoPageState extends State<StudentInfoPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  String name;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 100,
            primary: false,
            centerTitle: false,
            title: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 35.0,
                        backgroundImage:
                            AssetImage('assets/images/icons/student1.png'),
                        backgroundColor: Colors.white,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            name != null ? name : 'null',
                            style: TextStyle(
                                color: const Color(0xff07509d), fontSize: 23.0),
                          ))
                    ],
                  ),
                ),
              ],
            ),
            flexibleSpace: Image(
              image: AssetImage('assets/images/tool_bar_bg.png'),
              fit: BoxFit.cover,
              height: 100.0,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          )),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  width: 315,
                  height: 65,
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
                      'STUDENT INFO',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(0xFF144385),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TabBar(
                    unselectedLabelColor: Color(0xFF144385),
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Colors.white,
                    indicator: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFF9EDEFF)),
                    tabs: [
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: Color(0xFF9EDEFF), width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("STUDENT INFO"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: Color(0xFF9EDEFF), width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("FAMILY INFO"),
                          ),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: TabBarView(children: [
                    StudentInfo(),
                    StudentInfoADM(),
                  ]),
                ),
              ],
            )),
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
