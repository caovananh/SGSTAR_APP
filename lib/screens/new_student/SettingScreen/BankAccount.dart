import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarMainScreen.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/CardHeader.dart';


class BankAccount extends StatefulWidget {
  const BankAccount({key}) : super(key: key);

  @override
  _BankAccountState createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: CardHeader(
                  child: Text(
                    'bank account'.toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text('parent bank account'.toUpperCase(),style: TextStyle(color: Color(0xFF144385),fontWeight: FontWeight.bold),)),
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",textAlign: TextAlign.justify,),
                    SizedBox(height: 20.0,),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(color: Color(0xFF9EDEFF))
                          ),
                        child: TextField(
                          style: TextStyle(color: Color(0xFF144385)),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 10, top: 10, right: 15),
                            labelStyle: TextStyle(
                                color: Colors.black26
                            ),
                            labelText: "Account number *",
                            border: InputBorder.none,),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Color(0xFF9EDEFF))
                        ),
                        child: TextField(
                          style: TextStyle(color: Color(0xFF144385)),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 10, top: 10, right: 15),
                            labelStyle: TextStyle(
                                color: Colors.black26
                            ),
                            labelText: "Account holder *",
                            border: InputBorder.none,),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Color(0xFF9EDEFF))
                        ),
                        child: TextField(
                          style: TextStyle(color: Color(0xFF144385)),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 10, top: 10, right: 15),
                            labelStyle: TextStyle(
                                color: Colors.black26
                            ),
                            labelText: "Bank *",
                            border: InputBorder.none,),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Color(0xFF9EDEFF))
                        ),
                        child: TextField(
                          style: TextStyle(color: Color(0xFF144385)),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 10, top: 10, right: 15),
                            labelStyle: TextStyle(
                                color: Colors.black26
                            ),
                            labelText: "Branch *",
                            border: InputBorder.none,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                      "save".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Color(0xFF9EDEFF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Color(0xFF9EDEFF))),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80,),
          ]
      ),
    );
  }
}