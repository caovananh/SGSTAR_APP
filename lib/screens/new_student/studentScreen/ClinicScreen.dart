import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/CardHeader.dart';
import 'package:infixedu/screens/new_student/studentScreen/ClinicWidget/General.dart';
import 'package:infixedu/utils/Utils.dart';

class ClinicPage extends StatefulWidget {
  const ClinicPage({key}) : super(key: key);

  @override
  State<ClinicPage> createState() => ClinicPageState();
}

class ClinicPageState extends State<ClinicPage>
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
      appBar: AppBarWidget(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
        child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                CardHeader(child: Text('CLINIC')),
                SizedBox(
                  height: 20,
                ),
                TabBar(
                    unselectedLabelColor: Color(0xFF144385),
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Colors.white,
                    indicator: BoxDecoration(
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
                            child: Text(
                              "GENERAL INFORMATION",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                            ),
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
                            child: Text("MEDICALRECORDS",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: TabBarView(children: [
                    GeneralInfo(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                      child: Text('No data availabe'),
                    ),
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
