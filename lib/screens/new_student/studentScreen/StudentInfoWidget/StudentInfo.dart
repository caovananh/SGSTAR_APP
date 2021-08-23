import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/studentScreen/StudentInfoWidget/StudentInfoEdit.dart';

class StudentInfo extends StatefulWidget {
  const StudentInfo({key}) : super(key: key);

  @override
  _StudentInfoState createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 10, bottom: 20.0, top: 10.0),
            child: Text(
              "STUDENT INFORMATION",
              style: TextStyle(
                  color: Color(0xFF9EDEFF),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            padding: EdgeInsets.all(30),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 2, color: Color(0xFF9EDEFF)),
            ),
            child: Column(children: <Widget>[
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
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Text("First name (Given name): "),
                    Text(
                      "Lorem Ipsum",
                      style: TextStyle(color: Color(0xFF144385)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Text("Middle name(s) (if any): "),
                    Text("Lorem Ipsum",
                        style: TextStyle(color: Color(0xFF144385))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Text("Last name (Family name): "),
                    Text("Lorem Ipsum",
                        style: TextStyle(color: Color(0xFF144385))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Text("Preferred name (or nick name): ",
                            overflow: TextOverflow.ellipsis, maxLines: 1)),
                    Text("Lorem Ipsum",
                        style: TextStyle(color: Color(0xFF144385))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Text("Date of Birth: "),
                    Text("01/01/2005",
                        style: TextStyle(color: Color(0xFF144385))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Text("Gender: "),
                    Text("Male", style: TextStyle(color: Color(0xFF144385))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Text("Nationality: "),
                    Text("USA", style: TextStyle(color: Color(0xFF144385))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Text("Enrol in: "),
                    Text("Preschool",
                        style: TextStyle(color: Color(0xFF144385))),
                  ],
                ),
              ),
            ]),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // margin: EdgeInsets.all(25),
                child: OutlineButton(
                  child: Text("Enter information for the first time",
                      style: TextStyle(color: Color(0xFF144385))),
                  highlightedBorderColor: Color(0xFF9EDEFF),
                  borderSide: BorderSide(color: Color(0xFF9EDEFF)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () {},
                ),
              ),
              Container(
                // margin: EdgeInsets.all(25),
                child: FlatButton(
                  child: Text("Edit", style: TextStyle(color: Colors.white)),
                  color: Color(0xFF9EDEFF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StudentInfoEdit()),
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
