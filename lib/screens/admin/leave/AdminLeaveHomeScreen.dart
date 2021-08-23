// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:infixedu/utils/CustomAppBarWidget.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'AdminLeavePager.dart';

class LeaveAdminHomeScreen extends StatefulWidget {
  @override
  _LeaveAdminHomeScreenState createState() => _LeaveAdminHomeScreenState();
}

class _LeaveAdminHomeScreenState extends State<LeaveAdminHomeScreen> {
  int bottomSelectedIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: new Icon(Icons.timeline),
          label: "Pending",
          // title: new Text('Pending'),
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.done),
        label: "Approved",
        // title: new Text('Approved'),
      ),
      BottomNavigationBarItem(
          label: "Cancelled",
          icon: Icon(Icons.close),
          // title: Text('Rejected'),
      )
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        AdminLeavePage(InfixApi.pendingLeave, "pending_request"),
        AdminLeavePage(InfixApi.approvedLeave, "approved_request"),
        AdminLeavePage(InfixApi.rejectedLeave, "rejected_request"),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.indigo, //or set color with: Color(0xFF0000FF)
    ));
    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBarWidget(
          title: 'Leave',
        ),
        body: buildPageView(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomSelectedIndex,
          onTap: (index) {
            bottomTapped(index);
          },
          items: buildBottomNavBarItems(),
        ),
      ),
    );
  }
}
