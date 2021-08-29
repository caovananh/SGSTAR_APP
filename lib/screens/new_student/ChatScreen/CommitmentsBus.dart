import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';

class CommitmentsBus extends StatefulWidget {
  const CommitmentsBus({key}) : super(key: key);

  @override
  _CommitmentsBusState createState() => _CommitmentsBusState();
}

class _CommitmentsBusState extends State<CommitmentsBus> {
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
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.0,right: 15.0),
                            child: Text(
                              "commitment and regulations for using the sgsis school's student car service".toUpperCase(),
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                                  " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                                  "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                                  "It has survived not only five centuries, but also the leap into electronic typesetting, "
                                  "remaining essentially unchanged. It was popularised in the 1960s with the release of "
                                  "Letraset sheets containing Lorem Ipsum passages, and more recently "
                                  "with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",textAlign: TextAlign.justify,),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                  child: Text("1. publishing software like Aldus PageMaker including versions of Lorem Ipsum",textAlign: TextAlign.justify,)),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                  child: Text("2. publishing software like Aldus PageMaker including versions of Lorem Ipsum",textAlign: TextAlign.justify,)),
                              Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text("...")
                              )
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
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
                          "disagree".toUpperCase(),
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
                          "agree".toUpperCase(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

}