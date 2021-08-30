import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/month_calendar.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';


class BusHistoryDetail extends StatefulWidget {
  const BusHistoryDetail({key}) : super(key: key);

  @override
  _BusHistoryState createState() => _BusHistoryState();
}

class _BusHistoryState extends State<BusHistoryDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Scaffold(
        resizeToAvoidBottomInset: true,
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xff7cd3f7)
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          padding: const EdgeInsets.all(0),
                          child: Image.asset('assets/images/icons/calendar.png'),
                        ),
                      
                        Container(
                          height: 50,
                          width:  240,
                          decoration: BoxDecoration(
                            color: Color(0xff7cd3f7),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: Center(
                            child: Text('26/12/2021',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),
                        ),
                          ))
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Color(0xff7cd3f7))
                      )
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('25/12/2021',style: TextStyle(color: Color(0xff13438f),fontSize: 18,fontWeight: FontWeight.bold),),
                            Text('3:07 PM',style: TextStyle(color: Color(0xff13438f))),
                          ],
                        ),
                        Text('Get on',style: TextStyle(color: Color(0xff13438f),fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('#5 Su Hy Nhan Street ...',style: TextStyle(color: Color(0xff13438f))),
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Color(0xff7cd3f7))
                      )
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('25/12/2021',style: TextStyle(color: Color(0xff13438f),fontSize: 18,fontWeight: FontWeight.bold),),
                            Text('3:07 PM',style: TextStyle(color: Color(0xff13438f))),
                          ],
                        ),
                        Text('Get on',style: TextStyle(color: Color(0xff13438f),fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('#5 Su Hy Nhan Street ...',style: TextStyle(color: Color(0xff13438f))),
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Color(0xff7cd3f7))
                      )
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('25/12/2021',style: TextStyle(color: Color(0xff13438f),fontSize: 18,fontWeight: FontWeight.bold),),
                            Text('3:07 PM',style: TextStyle(color: Color(0xff13438f))),
                          ],
                        ),
                        Text('Get on',style: TextStyle(color: Color(0xff13438f),fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('#5 Su Hy Nhan Street ...',style: TextStyle(color: Color(0xff13438f))),
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Color(0xff7cd3f7))
                      )
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('25/12/2021',style: TextStyle(color: Color(0xff13438f),fontSize: 18,fontWeight: FontWeight.bold),),
                            Text('3:07 PM',style: TextStyle(color: Color(0xff13438f))),
                          ],
                        ),
                        Text('Get on',style: TextStyle(color: Color(0xff13438f),fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('#5 Su Hy Nhan Street ...',style: TextStyle(color: Color(0xff13438f))),
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Color(0xff7cd3f7))
                      )
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('25/12/2021',style: TextStyle(color: Color(0xff13438f),fontSize: 18,fontWeight: FontWeight.bold),),
                            Text('3:07 PM',style: TextStyle(color: Color(0xff13438f))),
                          ],
                        ),
                        Text('Get on',style: TextStyle(color: Color(0xff13438f),fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('#5 Su Hy Nhan Street ...',style: TextStyle(color: Color(0xff13438f))),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 80,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Color(0xff7cd3f7))
                          )
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('25/12/2021',style: TextStyle(color: Color(0xff13438f),fontSize: 18,fontWeight: FontWeight.bold),),
                                Text('3:07 PM',style: TextStyle(color: Color(0xff13438f))),
                              ],
                            ),
                            Text('Get on',style: TextStyle(color: Color(0xff13438f),fontSize: 18,fontWeight: FontWeight.bold),),
                            Text('#5 Su Hy Nhan Street ...',style: TextStyle(color: Color(0xff13438f))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Icon(FontAwesomeIcons.angleDoubleUp,color: Color(0xff13438f),size: 30,),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
