import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/ChatScreen/CommitmentsBus.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';

class GuardianRegister extends StatefulWidget {
  const GuardianRegister({key}) : super(key: key);

  @override
  _GuardianRegisterState createState() => _GuardianRegisterState();
}

class _GuardianRegisterState extends State<GuardianRegister> {
  bool isChecked = false;
  bool isChecked_1 = false;
  bool isChecked_2 = false;
  bool isChecked_3 = false;

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
                      CheckboxListTile(
                        title: Text("Guardian name 1",style: TextStyle(
                            color: isChecked_1? Color(0xFF144385) : Colors.grey[700]
                        ),),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: isChecked_1,
                        onChanged: (bool value) {
                          setState(() {
                            isChecked_1=value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text("Guardian name 2",style: TextStyle(
                          color: isChecked_2? Color(0xFF144385) : Colors.grey[700]
                        ),),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: isChecked_2,
                        onChanged: (bool value) {
                          setState(() {
                            isChecked_2=value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text("Guardian name 3",style: TextStyle(
                            color: isChecked_3 ? Color(0xFF144385) : Colors.grey[700]
                        ),),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: isChecked_3,
                        onChanged: (bool value) {
                          setState(() {
                            isChecked_3=value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text("I have read and agree to commitments",style: TextStyle(
                            color: isChecked? Color(0xFF144385) : Colors.grey[700]
                        ),),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: isChecked,
                        onChanged: (bool value) {
                          setState(() {
                            isChecked=value;
                            if(value){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CommitmentsBus()));
                            }
                          });
                        },
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0,right: 30.0,bottom: 30.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      border: Border.all(
                          color: Color(0xFF9EDEFF), // Set border color
                          width: 1.0),
                    ),
                    child: FlatButton(
                      onPressed: () {},
                        padding: EdgeInsets.all(20.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center ,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.add_circle,color: Color(0xFF9EDEFF),),
                          SizedBox(width: 10,),
                          Text('Add guardian name',style: TextStyle(color: Color(0xFF144385),fontWeight: FontWeight.w700),),
                        ]

                      )

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
                          "back".toUpperCase(),
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
                          "submit".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(width:3,color: Color(0xFF9EDEFF))),
                            title:  Text('registration confirmation'.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),
                            content:  Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry',style: TextStyle(color: Colors.black54),),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'No'),
                                child:  Text('NO',style: TextStyle(color: Colors.black26),),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Yes'),
                                child:  Text('YES',style: TextStyle(color: Color(0xFF9EDEFF)),),
                              ),
                            ],
                          ),
                        ),
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
