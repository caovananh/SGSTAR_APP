import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({key}) : super(key: key);
  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {

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
                  "subject".toUpperCase(),
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
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Text(
              "subject list".toUpperCase(),
              style: new TextStyle(
                color: Color(0Xff13438f),
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
             
            ),
          ),
          SizedBox(height: 15),        

          Column(
            children: [
              Container(
                width: MediaQuery. of(context). size. width-40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                            color: Color(0xff7cd3f7),
                            width: 2.0,
                            ),
                          )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Maths',style: TextStyle(fontSize: 18)),
                    Text('Tên giáo viên',style: TextStyle(fontSize: 18))
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery. of(context). size. width-40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                            color: Color(0xff7cd3f7),
                            width: 2.0,
                            ),
                          )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Physics',style: TextStyle(fontSize: 18)),
                    Text('Tên giáo viên',style: TextStyle(fontSize: 18))
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery. of(context). size. width-40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                            color: Color(0xff7cd3f7),
                            width: 2.0,
                            ),
                          )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Geography',style: TextStyle(fontSize: 18)),
                    Text('Tên giáo viên',style: TextStyle(fontSize: 18))
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery. of(context). size. width-40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                            color: Color(0xff7cd3f7),
                            width: 2.0,
                            ),
                          )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Fine art',style: TextStyle(fontSize: 18)),
                    Text('Tên giáo viên',style: TextStyle(fontSize: 18))
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery. of(context). size. width-40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                            color: Color(0xff7cd3f7),
                            width: 2.0,
                            ),
                          )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ECA',style: TextStyle(fontSize: 18)),
                    Text('Tên giáo viên',style: TextStyle(fontSize: 18))
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery. of(context). size. width-40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                            color: Color(0xff7cd3f7),
                            width: 2.0,
                            ),
                          )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Biology',style: TextStyle(fontSize: 18)),
                    Text('Tên giáo viên',style: TextStyle(fontSize: 18))
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery. of(context). size. width-40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                            color: Color(0xff7cd3f7),
                            width: 2.0,
                            ),
                          )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('History',style: TextStyle(fontSize: 18)),
                    Text('Tên giáo viên',style: TextStyle(fontSize: 18))
                  ],
                ),
              ),
            ],
          ),
          

        ],
      ),
    );
  }

 
}
