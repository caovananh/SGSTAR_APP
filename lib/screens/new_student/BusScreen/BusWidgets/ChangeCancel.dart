import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/BusScreen/BusWidgets/BusDropDown.dart';
import 'package:infixedu/screens/new_student/BusScreen/BusWidgets/bus_history.dart';
import 'package:infixedu/screens/new_student/BusScreen/GuardianRegister.dart';
import 'package:infixedu/screens/new_student/BusScreen/RegisterBus.dart';
import 'package:infixedu/screens/new_student/BusScreen/RouteTracking.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarMainScreen.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/custom_dropdown.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ChangeCancel extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBarWidget(),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background/BG_BUS-01.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 60.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF7dd3f7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    onPressed: () {
                      pushNewScreen(
                        context,
                        screen: RegisterBus(),
                        withNavBar: true, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Text(
                      'Registration change'.toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              BusDropDown(
                  title: Text("Cancel Service"),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                          child: Text("Pick up/drop off address in use",style: TextStyle(
                            color: Color(0xff07509d),fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: TextField()),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                          child: Text("Choose a service cancellation date",style: TextStyle(
                              color: Color(0xff07509d),fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                readOnly: true,
                                controller: _controller,
                                decoration: InputDecoration(
                                    labelStyle:
                                        TextStyle(color: Color(0xFF7dd3f7)),
                                    hintText: "dd/mm/yy",
                                hintStyle: TextStyle(color: Color(0xFF7dd3f7))),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.calendar_today_outlined),
                              color: Colors.grey,
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2999),
                                  builder:
                                      (BuildContext context, Widget child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                          primaryColor: const Color(0xff7cd3f7),
                                          //Head background
                                          accentColor: const Color(
                                              0xff7cd3f7) //selection color
                                          //dialogBackgroundColor: Colors.white,//Background color
                                          ),
                                      child: child,
                                    );
                                  },
                                ).then((selectedDate) {
                                  if (selectedDate != null) {
                                    // String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate).toString();
                                    // print(formattedDate);
                                    _controller.text = DateFormat('dd-MM-yyyy')
                                        .format(selectedDate)
                                        .toString();
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF7dd3f7),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25.0))),
                              onPressed: () {
                                pushNewScreen(
                                  context,
                                  screen: RegisterBus(),
                                  withNavBar: true,
                                  // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Text(
                                'Cancellation confirmation',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              )),
                        ),
                      ),
                      SizedBox(height: 15,),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
