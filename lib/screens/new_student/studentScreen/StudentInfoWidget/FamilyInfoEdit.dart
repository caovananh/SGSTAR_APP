import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';

enum SingingCharacter { Father, Guardian, PrimaryContact }
enum EnglishLevel { Beginner, GainingConfidence, Confidence, FLuent, Native }

class FamilyInfoEdit extends StatefulWidget {
  const FamilyInfoEdit({key}) : super(key: key);

  @override
  _FamilyInfoEditState createState() => _FamilyInfoEditState();
}

class _FamilyInfoEditState extends State<FamilyInfoEdit> {
  SingingCharacter _character = SingingCharacter.Father;
  EnglishLevel _level = EnglishLevel.Beginner;
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBarWidget(),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 10.0,left: 20.0,right: 20.0),
              child: Container(
                width: 315,
                height: 65,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  color: Color(0xFF9EDEFF),
                  borderRadius: BorderRadius.circular(
                    45.0,
                  ),
                ),
                child: Center(
                  child: Text(
                    'STUDENT INFO',
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF144385),
                        fontWeight: FontWeight.bold),
                  ),
                ),
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
                      "STUDENT INFO",
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
                      "FAMILY INFO",
                      style: TextStyle(
                          color: Color(0xFF144385), fontWeight: FontWeight.bold),
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
              padding: EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: Color(0xFF9EDEFF))
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0,right: 10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.keyboard_arrow_down_sharp),
                      style: TextStyle(color: Color(0xFF58595B),fontWeight: FontWeight.bold),
                      iconSize: 24,
                      elevation: 16,
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>[
                        'Enrol in',
                        'One',
                        'Two',
                        'Free',
                        'Four',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Father',style: TextStyle(color: Color(0xFF58595B))),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.Father,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Guardian',style: TextStyle(color: Color(0xFF58595B))),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.Guardian,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Primary Contact',style: TextStyle(color: Color(0xFF58595B))),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.PrimaryContact,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: 20, bottom: 20.0, top: 10.0, right: 20.0),
                child: Text(
                  "FATHER INFORMATION",
                  style: TextStyle(
                      color: Color(0xFF9EDEFF),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                        color: Color(0xFF58595B),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xFF9EDEFF)
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xFF9EDEFF)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: "Full name"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                        color: Color(0xFF58595B)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xFF9EDEFF)
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xFF9EDEFF)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: "Nationality"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                        color: Color(0xFF58595B)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xFF9EDEFF)
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xFF9EDEFF)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: "Occupation"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                        color: Color(0xFF58595B)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xFF9EDEFF)
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xFF9EDEFF)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: "Company"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                        color: Color(0xFF58595B)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xFF9EDEFF)
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xFF9EDEFF)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: "Work address"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                        color: Color(0xFF58595B)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xFF9EDEFF)
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xFF9EDEFF)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: "Phone"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                        color: Color(0xFF58595B)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xFF9EDEFF)
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xFF9EDEFF)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: "Personal email"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                        color: Color(0xFF58595B)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xFF9EDEFF)
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xFF9EDEFF)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: "First Language"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0,right: 20.0),
              child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(15.0)
                ),
                border: Border.all(
                    color: Color(0xFF9EDEFF), // Set border color
                    width: 1.0),
              ),
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30.0),
                          child: Text("English level: please check a box")),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: const Text('Beginner',style: TextStyle(fontSize: 12,color: Color(0xFF58595B)),),
                              leading: Radio<EnglishLevel>(
                                value: EnglishLevel.Beginner,
                                groupValue: _level,
                                onChanged: (EnglishLevel value) {
                                  setState(() {
                                    _level = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: const Text('Gaining Confidence',style: TextStyle(fontSize: 12,color: Color(0xFF58595B)),),
                              leading: Radio<EnglishLevel>(
                                value: EnglishLevel.GainingConfidence,
                                groupValue: _level,
                                onChanged: (EnglishLevel value) {
                                  setState(() {
                                    _level = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: const Text('Confidence',style: TextStyle(fontSize: 12,color: Color(0xFF58595B)),),
                              leading: Radio<EnglishLevel>(
                                value: EnglishLevel.Confidence,
                                groupValue: _level,
                                onChanged: (EnglishLevel value) {
                                  setState(() {
                                    _level = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: const Text('Fluent',style: TextStyle(fontSize: 12,color: Color(0xFF58595B)),),
                              leading: Radio<EnglishLevel>(
                                value: EnglishLevel.FLuent,
                                groupValue: _level,
                                onChanged: (EnglishLevel value) {
                                  setState(() {
                                    _level = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: const Text('Native',style: TextStyle(fontSize: 12,color: Color(0xFF58595B)),),
                              leading: Radio<EnglishLevel>(
                                value: EnglishLevel.Native,
                                groupValue: _level,
                                onChanged: (EnglishLevel value) {
                                  setState(() {
                                    _level = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(15.0)
                  ),
                  border: Border.all(
                      color: Color(0xFF9EDEFF), // Set border color
                      width: 1.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Home address in Ho Chi Minh City*"),
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9EDEFF)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9EDEFF)),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9EDEFF)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                  color: Color(0xFF9EDEFF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color(0xFF9EDEFF))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
