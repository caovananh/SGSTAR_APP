import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/CardHeader.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeesAndPayment3 extends StatefulWidget {
  const FeesAndPayment3({Key key}) : super(key: key);

  @override
  _FeesAndPayment3State createState() => _FeesAndPayment3State();
}

class _FeesAndPayment3State extends State<FeesAndPayment3> {
  String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: Column(
        children: [
          CardHeader(
              child: Text(
            'TUITION FEES IN 2020-2021',
            style: TextStyle(color: Colors.white),
          )),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        // margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: Color(0xFF7dd3f7)),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                            )),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF7dd3f7),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  )),
                              width: double.infinity,
                              height: 60,
                              child: Center(
                                child: Text(
                                  'Transfer money to SGSIS ',
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Parents use the service Internat banking/mobile banking of other banks, select function Transfer money in the account/card number and enter the serial number below to transfer funds to the account of the SGSIS (select beneficiary bank is the Bank...)',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    // width: MediaQuery.of(context).size.width / 2,
                                    margin: EdgeInsets.all(20),

                                    height: 60,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Color(0xFF7dd3f7)),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                        child: Text(
                                      '1111 2222 3333 4444',
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Color(0xffe4087e)),
                                    )),
                                  ),
                                  Text(
                                      'Or scan the QR code below to make the payment easier',
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.grey)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Container(
                                      width: 150,
                                      height: 150,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          // margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: Color(0xFF7dd3f7)),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                              )),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFF7dd3f7),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    )),
                                width: double.infinity,
                                height: 60,
                                child: Center(
                                  child: Text(
                                    'Payment via Onepay',
                                    style: TextStyle(
                                        fontSize: 25.0, color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Paying through Onepay by gateway by domestic ATM card/ Visa card/ Master card more easily.',
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
