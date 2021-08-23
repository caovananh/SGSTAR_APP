import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ignore: unnecessary_new
  final TextEditingController _passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: const BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: OutlinedButton(
                      onPressed: () {
                        // Respond to button press
                      },
                      child: const Text('ENGLISH'),
                      style: TextButton.styleFrom(
                        primary: const Color(0xff13438f),
                        side: const BorderSide(
                            color: Color(0xff13438f), width: 1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
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
                  child: Image.asset('assets/images/user.png'),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Peter Ivanov',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff13438f),
                    fontSize: 20,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: TextField(
                  obscureText: true,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  controller: _passController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff7cd3f7), width: 2.0),
                    ),
                    hintText: 'Password',
                    hintStyle:
                        TextStyle(fontSize: 20.0, color: Color(0xff13438f)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),

              const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xffd8d8d8),
                      fontSize: 13,
                    ),
                  ),
                ),
              ),

              // ignore: prefer_const_constructors
              Container(
                padding: const EdgeInsets.only(top: 50),
                width: 150,
                child: ElevatedButton(
                  child: const Text('LOG IN'),
                  onPressed: onSignInClicked,
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xff7cd3f7),
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Face ID',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff13438f),
                    fontSize: 16,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: 80,
                  height: 80,
                  padding: const EdgeInsets.fromLTRB(10, 2, 2, 2),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: const Color(0xff13438f),
                      ),
                      shape: BoxShape.circle,
                      color: Colors.white),
                  child: Image.asset('assets/images/favicon.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSignInClicked() {
    setState(() {
      if (_passController.text.length > 6) {
        // Navigator.push(
        //     context, MaterialPageRoute<void>(builder: (context) => HomePage()));
      }
    });
  }
}
