import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/custom_dropdown.dart';

class StudentInfoPage extends StatefulWidget {
  const StudentInfoPage({key}) : super(key: key);

  @override
  State<StudentInfoPage> createState() => StudentInfoPageState();
}

class StudentInfoPageState extends State<StudentInfoPage>
  with SingleTickerProviderStateMixin {
  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
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
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: Color(0xFF9EDEFF))
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: const Color(0xff7cd3f7),
                            ),
                            shape: BoxShape.circle,
                            color: Colors.white),
                        child: Image.asset('assets/images/icons/student1.png'),
                      ),
                      SizedBox(width: 30,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(getName() != null ? getName().toUpperCase() : 'null',
                            style:TextStyle(color: Color(0xff13438f),fontSize: 15,fontWeight: FontWeight.w700)),
                          SizedBox(height: 10,),
                          Text('Class:'),
                          SizedBox(height: 10,),
                          Text('Teacher:')
                        ],
                      ),
                    ],
                  ),
                ),

                CusTomDropDown(
                  title: Text('personal'.toUpperCase()),
                  content: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Text('First name(Given name):'),
                            Text(' Lorem Ipsum',style: TextStyle(color: Color(0xff13438f),fontSize: 16,fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 10),
                        child: Row(
                          children: [
                            Text('Middle name(if any):'),
                            Text(' Lorem Ipsum',style: TextStyle(color: Color(0xff13438f),fontSize: 16,fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 10),
                        child: Row(
                          children: [
                            Text('Last name(Family name):'),
                            Text(' Lorem Ipsum',style: TextStyle(color: Color(0xff13438f),fontSize: 16,fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 10),
                        child: Row(
                          children: [
                            Text('Preferred name(or nick name):'),
                            Text(' Lorem Ipsum',style: TextStyle(color: Color(0xff13438f),fontSize: 16,fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 10),
                        child: Row(
                          children: [
                            Text('Date of Birth'),
                            Text(' 01/01/2005',style: TextStyle(color: Color(0xff13438f),fontSize: 16,fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 10),
                        child: Row(
                          children: [
                            Text('Gender:'),
                            Text(' Male',style: TextStyle(color: Color(0xff13438f),fontSize: 16,fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 10),
                        child: Row(
                          children: [
                            Text('Nationality:'),
                            Text(' USA',style: TextStyle(color: Color(0xff13438f),fontSize: 16,fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 10),
                        child: Row(
                          children: [
                            Text('Enrol in:'),
                            Text(' PreSchool',style: TextStyle(color: Color(0xff13438f),fontSize: 16,fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    
                    
                    ],
                )),  

                CusTomDropDown(
                  title: Text('parents'.toUpperCase()),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                             bottom:
                              BorderSide(width: 2.0, color: const Color(0xFF7dd3f7)),
                          )),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 10),
                          child: Text('Father',style: TextStyle(color: Color(0xff13438f),fontSize: 18,fontWeight: FontWeight.w800)),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: const Color(0xff7cd3f7),
                                  ),
                                  shape: BoxShape.circle,
                                  color: Colors.white),
                              child: Image.asset('assets/images/icons/student1.png'),
                            ),
                            SizedBox(width: 5,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Full name:'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Nationality:'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Company:'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Work Adress:'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Phone:'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Personal Email:'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('First Language:'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('English Level:'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Home address in Ho Chi Minh city:'),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                             top:
                              BorderSide(width: 2.0, color: const Color(0xFF7dd3f7)),
                             bottom:
                              BorderSide(width: 2.0, color: const Color(0xFF7dd3f7)),
                          )),
                        child: Padding(
                          padding: const EdgeInsets.only(top:15,left: 20,bottom: 15),
                          child: Text('Mother',style: TextStyle(color: Color(0xff13438f),fontSize: 18,fontWeight: FontWeight.w800)),
                        ),
                      ),

                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: const Color(0xff7cd3f7),
                                ),
                                shape: BoxShape.circle,
                                color: Colors.white),
                            child: Image.asset('assets/images/icons/student1.png'),
                          ),
                          SizedBox(width: 5,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Full name:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Nationality:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Company:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Work Adress:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Phone:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Personal Email:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('First Language:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('English Level:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Home address in Ho Chi Minh city:'),
                              )
                            ],
                          ),
                        ],
                      ),
                     ),

                     Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                             top:
                              BorderSide(width: 2.0, color: const Color(0xFF7dd3f7)),
                             bottom:
                              BorderSide(width: 2.0, color: const Color(0xFF7dd3f7)),
                          )),
                        child: Padding(
                          padding: const EdgeInsets.only(top:15,left: 20,bottom: 15),
                          child: Text('Guardian',style: TextStyle(color: Color(0xff13438f),fontSize: 18,fontWeight: FontWeight.w800)),
                        ),
                      ),

                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: const Color(0xff7cd3f7),
                                ),
                                shape: BoxShape.circle,
                                color: Colors.white),
                            child: Image.asset('assets/images/icons/student1.png'),
                          ),
                          SizedBox(width: 5,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Full name:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Nationality:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Company:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Work Adress:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Phone:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Personal Email:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('First Language:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('English Level:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Home address in Ho Chi Minh city:'),
                              )
                            ],
                          ),
                        ],
                      ),
                     ),
    
                    ],
                )),

              ],
            ),
          ),
        ],
      ),
    );
  }

  String getName() {
    Utils.getStringValue('full_name').then((value) {
      setState(() {
        name = value;
      });
    });
    return name;
  }
}
