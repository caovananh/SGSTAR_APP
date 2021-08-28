import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({key}) : super(key: key);
  @override
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: Container(
                width: double.infinity,
                child: new Text(
                  "teacher contact".toUpperCase(),
                  style: new TextStyle(
                    color: Color(0Xff13438f),
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
                  color: Color(0xff7cd3f7),
                ),
                padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              ),
            ),
          ),
          SizedBox(height: 25),
          
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Color(0xff7cd3f7),width: 2)
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Color(0xff7cd3f7),width: 2)
              ),
              prefixIcon: Icon(Icons.search,color: Color(0xff13438f),size: 30,),
              labelText: 'search'.toUpperCase(),
              labelStyle: TextStyle(color: Color(0xff13438f))
            ),
              ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xff7cd3f7),width: 2))
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
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
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tên giáo viên',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                      Text('GVCN Year 1N'),
                      Text('GV Toán Year 1N'),
                      Text('GV Bơi Year 1N'),
                      Text('Read more',style: TextStyle(color: Color(0xff13438f),fontStyle: FontStyle.italic),)
                    ],
                  ),
                  SizedBox(width: 10),
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(    
                            shape: BoxShape.circle,
                            color: Colors.white),
                        child: Image.asset('assets/images/icons/call.png'),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(    
                            shape: BoxShape.circle,
                            color: Colors.white),
                        child: Image.asset('assets/images/icons/chatgreen.png'),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(  
                            shape: BoxShape.circle,
                            color: Colors.white),
                        child: Image.asset('assets/images/icons/mailbox.png'),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
    
        ],
      ),
    );
  }

 
}
