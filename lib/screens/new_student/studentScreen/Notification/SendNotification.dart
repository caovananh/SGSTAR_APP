import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/studentScreen/note_detail.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SendNote extends StatefulWidget {
  const SendNote({key}) : super(key: key);
  @override
  _SendNoteState createState() => _SendNoteState();
}

class _SendNoteState extends State<SendNote> {

  bool hasData = false;
  bool isSending=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: EdgeInsets.only(
            top: 20.0, bottom: 30.0, left: 20.0, right: 20.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              25.0,
            ),
            border: Border.all(
              color: Color(0xFF9EDEFF),
              width: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height*0.075,
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
                          'SKILL CHART',
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFF144385),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextField(
                    minLines: 15,
                    maxLines: null,
                    // controller: _controllerInputSkill1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),

                  Center(
                      child:
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(fontSize: 24),
                              maximumSize: Size.fromHeight(72),
                              shape: StadiumBorder()
                          ),
                          onPressed: () async{
                            print('ok');
                            // storeStudentSkill();
                            if(isSending) return;
                            setState(() {
                              isSending=true;
                            });
                            await Future.delayed(Duration(seconds: 60));
                            print('ok');
                          },
                          child: isSending ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(color: Colors.white,)),
                              const SizedBox(width: 24,),
                              Text('Please Wait...')
                            ],
                          ) : Text('Save'),
                        ),
                      )
                    // OutlinedButton.icon(
                    //   onPressed: () {
                    //     storeStudentSkill();
                    //     print('ok');
                    //   },
                    //   label: Text('Save'),
                    //   icon: Icon(Icons.edit_sharp),
                    // ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}