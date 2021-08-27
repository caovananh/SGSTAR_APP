import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/custom_dropdown.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/server/Login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class StudentInfoPage extends StatefulWidget {
  const StudentInfoPage({key}) : super(key: key);

  @override
  State<StudentInfoPage> createState() => StudentInfoPageState();
}

class StudentInfoPageState extends State<StudentInfoPage>
    with SingleTickerProviderStateMixin {
  String name;
  String id;
  String firstname;
  String lastname;
  String gender;
  String date_of_birth;
  String class_name;
  String nationality;
  String nick_name;
  String middle_name;
  String father_name;
  String father_nationality;
  String father_company;
  String father_workAddress;
  String father_phone;
  String father_email;
  String father_first_language;
  String father_english_level;
  String mother_name;
  String guardian_name;

  String getFirstName() {
    Utils.getStringValue('first_name').then((value) {
      setState(() {
        firstname = value;
      });
    });
    return firstname;
  }

  String getStudentId() {
    Utils.getStringValue('id').then((value) {
      setState(() {
        id = value;
      });
    });

    return id;
  }
  Future<void> loadId() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var _id = _prefs.getString("id");
    setState(() {
      id = _id;
    });
    print(id);
  }
  String _getUserId()  {
    Utils.getStringValue('id').then((value) {
      setState(() {
        id=value;
      });
    });
    return id;
  }
  @override
  void initState() {
    _getUserId();
    // getClassName(getName());
    //getStudentId();
    super.initState();
    //loadId();
   // getParentInfo(int.parse(id));

    SharedPreferences.getInstance().then((prefValue) => {
      setState(() {
        id = prefValue.getString('StudentId')?? "";
      })
    });
    print(id);
  }



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
                      border: Border.all(color: Color(0xFF9EDEFF))),
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
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              getName() != null
                                  ? getName().toUpperCase()
                                  : 'null',
                              style: TextStyle(
                                  color: Color(0xff13438f),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(class_name != null
                              ? 'Class: ' + class_name
                              : 'class: '),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Teacher:')
                        ],
                      ),
                    ],
                  ),
                ),
                //Info
                CusTomDropDown(
                    title: Text('personal'.toUpperCase()),
                    content: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text('First name(Given name):'),
                              Text(
                                  getFirstName() != null
                                      ? getFirstName().toUpperCase()
                                      : 'null',
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Row(
                            children: [
                              Text('Middle name(if any):'),
                              Text(middle_name != null ? middle_name : '',
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Row(
                            children: [
                              Text('Last name(Family name):'),
                              Text(
                                  getLastName() != null
                                      ? getLastName().toUpperCase()
                                      : '',
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Row(
                            children: [
                              Text('Preferred name(or nick name):'),
                              Text(nick_name != null ? nick_name : '',
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Row(
                            children: [
                              Text('Date of Birth: '),
                              Text(
                                  getBirth() != null
                                      ? getBirth().toUpperCase()
                                      : 'null',
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Row(
                            children: [
                              Text('Gender: '),
                              Text(
                                  getGender() != null
                                      ? getGender() == "1"
                                          ? "Male"
                                          : "Female"
                                      : 'null',
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Row(
                            children: [
                              Text('Nationality:'),
                              Text(nationality != null ? nationality : '',
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Row(
                            children: [
                              Text('Enrol in: '),
                              Text(class_name != null ? class_name : '',
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        FlatButton(
                            onPressed: () {
                              //getStudentId();
                              // getClassName(getFirstName());
                            },
                            child: Text("Test"))
                      ],
                    )),
                //Family
                CusTomDropDown(
                    title: Text('parents'.toUpperCase()),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                                width: 2.0, color: const Color(0xFF7dd3f7)),
                          )),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20, bottom: 10),
                            child: Text('Father',
                                style: TextStyle(
                                    color: Color(0xff13438f),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800)),
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
                                child: Image.asset(
                                    'assets/images/icons/student1.png'),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(father_name != null
                                        ? 'Full name: ' + father_name
                                        : 'Full name:'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(father_nationality != null
                                        ? 'Nationality: ' + father_nationality
                                        : 'Nationality:'),
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
                                    child: Text(father_phone != null
                                        ? 'Phone: ' + father_phone.toString()
                                        : 'Phone:'),
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
                                    child: Text(
                                        'Home address in Ho Chi Minh city:'),
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
                            top: BorderSide(
                                width: 2.0, color: const Color(0xFF7dd3f7)),
                            bottom: BorderSide(
                                width: 2.0, color: const Color(0xFF7dd3f7)),
                          )),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 20, bottom: 15),
                            child: Text('Mother',
                                style: TextStyle(
                                    color: Color(0xff13438f),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800)),
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
                                child: Image.asset(
                                    'assets/images/icons/student1.png'),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(mother_name != null
                                        ? 'Full name: ' + mother_name
                                        : 'Full name:'),
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
                                    child: Text(
                                        'Home address in Ho Chi Minh city:'),
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
                            top: BorderSide(
                                width: 2.0, color: const Color(0xFF7dd3f7)),
                            bottom: BorderSide(
                                width: 2.0, color: const Color(0xFF7dd3f7)),
                          )),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 20, bottom: 15),
                            child: Text('Guardian',
                                style: TextStyle(
                                    color: Color(0xff13438f),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800)),
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
                                child: Image.asset(
                                    'assets/images/icons/student1.png'),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(guardian_name != null
                                        ? 'FUll name: ' + guardian_name
                                        : 'Full name:'),
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
                                    child: Text(
                                        'Home address in Ho Chi Minh city:'),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                //Transport
                CusTomDropDown(
                    title: Text('transport'.toUpperCase()),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('pick up point:'.toUpperCase(),
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  '156 Cach Mang Thang Tam, Ward 12 ,District 10, HCM City'),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('drop-off point:'.toUpperCase(),
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  '156 Cach Mang Thang Tam, Ward 12 ,District 10, HCM City'),
                            ],
                          ),
                        ),
                      ],
                    )),
                //Fees
                CusTomDropDown(
                    title: Text('fee'.toUpperCase()),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tuition fees in 2021-2022:',
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('No Date available'),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Food service fees:',
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('No Date available'),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('School bus fees:',
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('No Date available'),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Uniform:',
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('No Date available'),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Book:',
                                  style: TextStyle(
                                      color: Color(0xff13438f),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('No Date available'),
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

  String getLastName() {
    Utils.getStringValue('last_name').then((value) {
      setState(() {
        lastname = value;
      });
    });
    return lastname;
  }

  String getGender() {
    Utils.getStringValue('gender').then((value) {
      setState(() {
        gender = value;
      });
    });
    return gender;
  }

  String getBirth() {
    Utils.getStringValue('date_of_birth').then((value) {
      setState(() {
        date_of_birth = value;
      });
    });
    return date_of_birth;
  }

  Future<void> getClassName(String name) async {
    final response = await http.get(Uri.parse(InfixApi.getStudentByName(name)));
    var jsonData = json.decode(response.body);
    //print(jsonData['data']['students']['class_name']);
    setState(() {
      class_name = jsonData['data']['students']['class_name'];
    });
    print(class_name);
  }

  Future<void> getParentInfo(int id) async {
    final response = await http.get(Uri.parse(InfixApi.getStudentInfo(id)));
    var jsonData = json.decode(response.body);
    print(jsonData['data']['parent_detail']);
    setState(() {
      father_name = jsonData['data']['parent_detail']['fathers_name'];
      father_nationality =
          jsonData['data']['parent_detail']['fathers_nationality'];
      father_company = jsonData['data']['parent_detail']['fathers_company'];
      father_workAddress =
          jsonData['data']['parent_detail']['fathers_work_address'];
      father_phone =
          jsonData['data']['parent_detail']['fathers_mobile'].toString();
      father_email = jsonData['data']['parent_detail']['fathers_email'];
      father_first_language =
          jsonData['data']['parent_detail']['fathers_first_language'];
      father_english_level =
          jsonData['data']['parent_detail']['fathers_language_level'];
      mother_name = jsonData['data']['parent_detail']['mothers_name'];
      guardian_name = jsonData['data']['parent_detail']['guardians_name'];
    });
    print(father_name);
    print(father_nationality);
    print(father_company);
    print(father_workAddress);
    print(father_first_language);
    print(father_english_level);
    print(father_email);
    print(father_phone);
    print(mother_name);
    print(guardian_name);
    // print(mother_name);
  }
}
