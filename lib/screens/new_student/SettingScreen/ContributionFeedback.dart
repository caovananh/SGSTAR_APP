import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarMainScreen.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/CardHeader.dart';

class ContributionsFeedback extends StatefulWidget {
  const ContributionsFeedback({key}) : super(key: key);

  @override
  _ContributionsFeedbackState createState() => _ContributionsFeedbackState();
}

class _ContributionsFeedbackState extends State<ContributionsFeedback> {
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
              'contributions & feedback'.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0,top: 20.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  border: Border.all(
                      color: Color(0xFF9EDEFF), // Set border color
                      width: 1.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Content",
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  minLines: 5,
                  // any number you need (It works as the rows for the textarea)
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                )),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
                border: Border.all(
                    color: Color(0xFF9EDEFF), // Set border color
                    width: 1.0),
              ),
              child: FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center ,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.add,color: Color(0xFF144385),),
                        SizedBox(width: 10,),
                        Text('Add photo',style: TextStyle(color: Color(0xFF144385),fontWeight: FontWeight.bold),),
                      ]

                  )
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
                    "submit".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color(0xFF9EDEFF))),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
