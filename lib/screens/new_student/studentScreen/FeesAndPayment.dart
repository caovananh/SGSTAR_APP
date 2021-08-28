import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/CardHeader.dart';
import 'package:infixedu/screens/new_student/studentScreen/ClinicWidget/General.dart';
import 'package:infixedu/screens/new_student/studentScreen/FeesAndPayment2.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class FeesAndPayment extends StatefulWidget {
  const FeesAndPayment({Key key}) : super(key: key);

  @override
  _FeesAndPaymentState createState() => _FeesAndPaymentState();
}

class _FeesAndPaymentState extends State<FeesAndPayment> {
  final unpaid = List<String>.generate(5, (i) => "Tuition fees");

  final paid = List<String>.generate(5, (i) => "Tuition fees");

  int _selected_fee = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            CardHeader(child: Text('FEES AND PAYMENT')),
            SizedBox(
              height: 20,
            ),
            TabBar(
                unselectedLabelColor: Color(0xFF7dd3f7),
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
                          border:
                              Border.all(color: Color(0xFF9EDEFF), width: 2)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "UNPAID",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: Color(0xFF9EDEFF), width: 2)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("PAID",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                ]),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TabBarView(children: [
                  ListView.builder(
                    itemCount: paid.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          selectfee(index);
                        },
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                                width: 3.0, color: Color(0xFF9EDEFF)),
                          )),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              paid[index],
                              style: TextStyle(
                                  fontSize: 20,
                                  color: _selected_fee == index
                                      ? Color(0xFF9EDEFF)
                                      : Colors.black),
                            ),
                            subtitle: Text('Deadline:20/12/2021',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: _selected_fee == index
                                        ? Color(0xFF9EDEFF)
                                        : Color(0xffe4087e))),
                          ),
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: unpaid.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            border: Border(
                          bottom:
                              BorderSide(width: 3.0, color: Color(0xFF9EDEFF)),
                        )),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                unpaid[index],
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              Text('Done',
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFF9EDEFF))),
                              Text('Invoice request',
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xffe4087e)))
                            ]),
                      );
                    },
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectfee(int index) {
    setState(() {
      _selected_fee = index;
    });
    Timer(Duration(milliseconds: 300), () {
      pushNewScreen(
        context,
        screen: FeesAndPayment2(),
        withNavBar: false, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
      setState(() {
        _selected_fee = null;
      });
    });
  }
}
