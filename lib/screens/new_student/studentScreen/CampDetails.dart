import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';

class CampDetails extends StatefulWidget {
  const CampDetails({Key key}) : super(key: key);

  @override
  _CampDetailsState createState() => _CampDetailsState();
}

class _CampDetailsState extends State<CampDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff07509d),
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
                      child: Text('SUMMER CAMP 2021',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff)))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                      image:
                          AssetImage('assets/images/icons/summer_camp.png'))),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SUMMER CAMP 2021'),
                  Container(height: 10),
                  Text('Skills & Attitude:'),
                  Container(height: 10),
                  Text('Field trips:'),
                  Container(height: 10),
                  Text('Student grouping by age:'),
                  Container(height: 10),
                  Text('Simple week:'),
                  Container(height: 10),
                  Text('Fee:'),
                ],
              ),
            ),
            Container(
              height: 100,
              child: Center(
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text('REGISTERED'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xffe4087e)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
