import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/scheduler.dart';

class LoginWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    body: Center(
      child: ListView(
        padding: EdgeInsets.all(32),
        children: [
          // if (!isKeyBoard)
          Image.asset('assets/images/logo_icon/launcher.png',width: 100,height: 100,),
          SizedBox(height: 10,),
          Container(
            height: 40.0,
            width: 250.0,
            child: TextField(
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Color(0xFF144385)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xFF9EDEFF)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xFF9EDEFF)),
                ),
                border: OutlineInputBorder(),
                labelText: 'Email/Phone Number',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.centerRight,
            child: Text('Forgot Email/Phone Number?',
                style: TextStyle(
                    fontSize: 10, fontWeight: FontWeight.w500,color: Colors.grey)),
          ),
          SizedBox(height: 8),
          Container(
            height: 40.0,
            width: 250.0,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Color(0xFF144385)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xFF9EDEFF)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xFF9EDEFF)),
                ),
                border: OutlineInputBorder(
                ),
                labelText: 'Password',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.centerRight,
            child: Text('Forgot Password ?',
                style: TextStyle(
                    fontSize: 10, fontWeight: FontWeight.w500,color: Colors.grey)),
          ),
          SizedBox(height: 8),
          Column(
            children: [
              ElevatedButton(onPressed: () {

              }, child: Text('SIGN UP'),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF9EDEFF),
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(30)
                    ),
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold
                    )
                ),),
            ],
          )
        ],
      ),
    ),
  );
}