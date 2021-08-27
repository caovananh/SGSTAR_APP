import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/Utils.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({key}) : super(key: key);
  @override
  _LeaveScreenState createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {

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
                  "leave".toUpperCase(),
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
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "information required to leave".toUpperCase(),
                style: new TextStyle(
                  color: Color(0Xff13438f),
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
               
              ),
            ],
          ),
          SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xff7cd3f7),width: 2)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                   style: TextStyle(color: Colors.black45),
                   decoration: InputDecoration.collapsed(
                              hintText: "Type of leave request",
                              hintStyle: TextStyle(
                                  fontSize: 14.0, color: Color(0xffd8d8d8)))
                ),
              ),
            ),
          ),
          
        
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 3),
            child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Color(0xff7cd3f7), width: 2.0)),
                child: Padding(
                  padding: EdgeInsets.only(top: 10, left: 15),
                  child: TextField(
                    style: TextStyle(color: Colors.black45),
                    maxLines: 8,
                    decoration: InputDecoration.collapsed(
                        hintText: "Content ...",
                        hintStyle: TextStyle(
                            fontSize: 14.0, color: Color(0xffd8d8d8))),
                  ),
                )),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: StadiumBorder(),
                side: BorderSide(
                  width: 2,
                  color: Color(0xff7cd3f7),
                ),
              ),
              child: Text('+ Add photo',style: TextStyle(color: Color(0xff13438f),fontSize: 16, fontWeight: FontWeight.w700),),
              onPressed: () async {
                var picked = await FilePicker.platform.pickFiles();

                if (picked != null) {
                  print(picked.files.first.name);
                }
              },
            ),
          ),
          

          Center(
                  child: ElevatedButton(         
                    onPressed: () {},
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffe4087e),
                      fixedSize: Size(140, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // <-- Radius
                      ),
                    ),
                  ),
                ),

        ],
      ),
    );
  }

 
}
