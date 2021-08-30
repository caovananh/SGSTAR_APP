import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarMainScreen.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/CardHeader.dart';


class ParentInformation extends StatefulWidget {
  const ParentInformation({key}) : super(key: key);

  @override
  _ParentInformationState createState() => _ParentInformationState();
}

class _ParentInformationState extends State<ParentInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.4,
                color: Color(0xFF9EDEFF),
              ),
            ],
          ),
          Positioned(
            top: 50,
            left: 50,
            right: 50,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 55.0,
                  backgroundImage:
                  AssetImage('assets/images/icons/student1.png'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 20,),
                Text("Lorem Ipsum",style: TextStyle(color: Color(0xFF144385),
                    fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          Positioned(
            top: 230,
            left: 20,
            right: 20,
            child: Container(
              //width: MediaQuery.of(context).size.width*1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                border: Border.all(
                    color: Color(0xFF9EDEFF), // Set border color
                    width: 1.0),
                color: Colors.white
              ),
              child: Column(
                children: [
                  Padding(
                    padding:EdgeInsets.only(top: 25.0),
                    child: Text('Parent information'.toUpperCase(),style: TextStyle(fontSize: 15,color: Color(0xFF144385),
                        fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 1.0
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Full name:"),
                          Text("Lorem Ipsum")
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 1.0
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Phone number"),
                          Text("123456")
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 1.0
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Email:"),
                          Text("Lorem Ipsum")
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 1.0
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Relationship:"),
                          Text("Lorem")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

