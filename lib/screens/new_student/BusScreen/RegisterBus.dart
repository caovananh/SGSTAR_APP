import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/BusScreen/GuardianRegister.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarMainScreen.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';

class RegisterBus extends StatefulWidget {
  const RegisterBus({key}) : super(key: key);

  @override
  _RegisterBusState createState() => _RegisterBusState();
}

class _RegisterBusState extends State<RegisterBus> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          )
                        ],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                      child: FlatButton(
                        child: Text(
                          "current year".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {},
                        color: Color(0xFF9EDEFF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Color(0xFF9EDEFF))),
                      ),
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          )
                        ],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                      child: FlatButton(
                        child: Text(
                          "next year".toUpperCase(),
                          style: TextStyle(
                              color: Color(0xFF144385),
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {},
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Color(0xFF9EDEFF))),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      border: Border.all(
                          color: Color(0xFF9EDEFF), // Set border color
                          width: 1.0),
                    ),
                    child: Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ),
                          color: Color(0xFF9EDEFF),
                        ),
                        child: Center(
                          child: Text(
                            'student name'.toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (bool value) {
                                setState(() {
                                  isChecked = value;
                                });
                              },
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'pick up at home'.toUpperCase(),
                                  style: TextStyle(
                                      color: Color(0xFF144385),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("Student's home address: "),
                                Text(
                                  '(Choose another address)',
                                  style: TextStyle(
                                      color: Color(0xFF144385),
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: TextField(
                                    maxLines: null,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (bool value) {
                                setState(() {
                                  isChecked = value;
                                });
                              },
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'pick up at the point'.toUpperCase(),
                                  style: TextStyle(
                                      color: Color(0xFF144385),
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: TextField(
                                    maxLines: null,
                                    decoration: new InputDecoration(
                                        hintText: 'Point name'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      )
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                  child: FlatButton(
                    child: Text(
                      "next".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GuardianRegister()));
                    },
                    color: Color(0xFF9EDEFF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Color(0xFF9EDEFF))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
