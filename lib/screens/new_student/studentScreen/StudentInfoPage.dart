import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/studentScreen/StudentInfoWidget/StudentInfo.dart';
import 'package:infixedu/screens/new_student/studentScreen/StudentInfoWidget/StudentInfoADM.dart';
import 'package:infixedu/utils/Utils.dart';
import 'StudentInfoWidget/StudentCollapse.dart';

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
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    mediaQueryData.size.width;
    mediaQueryData.size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: mediaQueryData.size.height * 0.03,
                  left: mediaQueryData.size.width * 0.08,
                  right: mediaQueryData.size.width * 0.08),
              child: Container(
                width: mediaQueryData.size.width * 1,
                height: mediaQueryData.size.height * 0.08,
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
                    'student info'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF144385),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: mediaQueryData.size.height * 0.03,
                  left: mediaQueryData.size.width * 0.08,
                  right: mediaQueryData.size.width * 0.08),
              child: Container(
                padding: EdgeInsets.all(30),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 2, color: Color(0xFF9EDEFF)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // padding: EdgeInsets.only(left: 10),
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            border: new Border.all(
                              color: Color(0xFF9EDEFF),
                              width: 2.0,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 35.0,
                            backgroundImage:
                                AssetImage('assets/images/icons/student1.png'),
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nguyen Van A"),
                            Row(
                              children: [
                                Text("Teacher"),
                                Text("James"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Class"),
                                Text("Year 1 n".toUpperCase()),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: StudentCollapse(
                title: Text('transport'.toUpperCase()),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('pick up point'.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xFF144385),
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('156 Cach Mang Thang 8, phuong 12, quan 10, tp.HCM'),
                    SizedBox(height: 25),
                    Text('drop-off point'.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xFF144385),
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('156 Cach Mang Thang 8, phuong 12, quan 10, tp.HCM'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: StudentCollapse(
                title: Text('fee'.toUpperCase()),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Tuition fees in 2021-2022',
                        style: TextStyle(
                            color: Color(0xFF144385),
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('No data available'),
                    SizedBox(height: 25),
                    Text('Food service fees',
                        style: TextStyle(
                            color: Color(0xFF144385),
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('No data available'),
                    SizedBox(height: 25),
                    Text('School bus fees',
                        style: TextStyle(
                            color: Color(0xFF144385),
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('No data available'),
                    SizedBox(height: 25),
                    Text('Uniform',
                        style: TextStyle(
                            color: Color(0xFF144385),
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('No data available'),
                    SizedBox(height: 25),
                    Text('Book',
                        style: TextStyle(
                            color: Color(0xFF144385),
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('No data available'),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ),
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
