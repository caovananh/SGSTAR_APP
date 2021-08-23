import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/studentScreen/StudentInfoWidget/FamilyInfoEdit.dart';
import 'package:infixedu/screens/new_student/studentScreen/StudentInfoWidget/StudentEditPage.dart';

class StudentInfoADM extends StatefulWidget {
  const StudentInfoADM({key}) : super(key: key);

  @override
  _StudentInfoADMState createState() => _StudentInfoADMState();
}

String valueChoose;
List listItem = ["Item 1", "Item 2", "Item 3", "Item 4"];

class _StudentInfoADMState extends State<StudentInfoADM> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 10, bottom: 20.0, top: 10.0),
            child: Text(
              "FATHER INFORMATION",
              style: TextStyle(
                  color: Color(0xFF9EDEFF),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
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
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(child: Text("Full name: ")),
                    Expanded(
                        child: Text(
                      "Huynh Tan Duong",
                      style: TextStyle(color: Color(0xFF144385)),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(child: Text("Nationality: ")),
                    Expanded(
                        child: Text("Viet Nam",
                            style: TextStyle(color: Color(0xFF144385)))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(child: Text("Company: ")),
                    Expanded(
                        child: Text(
                            "Residential #5, Sử Hy Nhan, Phường THạnh Mỹ Lợi, Quận 2, Thành phố Hồ Chí Minh",
                            style: TextStyle(color: Color(0xFF144385)))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Text("Phone: ",
                            overflow: TextOverflow.ellipsis, maxLines: 1)),
                    Expanded(
                        child: Text("012345678",
                            style: TextStyle(color: Color(0xFF144385)))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(child: Text("Personal email: ")),
                    Expanded(
                        child: Text("duonghuynh@sgstar.edu.vn",
                            style: TextStyle(color: Color(0xFF144385)))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(child: Text("First language: ")),
                    Expanded(
                        child: Text("Vietnamese",
                            style: TextStyle(color: Color(0xFF144385)))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(child: Text("English level: ")),
                    Expanded(
                        child: Text("Native",
                            style: TextStyle(color: Color(0xFF144385)))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(child: Text("Home address in Ho Chi MInh City: ")),
                    Expanded(
                        child: Text(
                            "Residential #5, Sử Hy Nhan, Phường THạnh Mỹ Lợi, Quận 2, Thành phố Hồ Chí Minh",
                            style: TextStyle(color: Color(0xFF144385)))),
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
                        MaterialPageRoute(builder: (context) => FamilyInfoEdit()),
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
