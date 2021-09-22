import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarMainScreen.dart';

class ELearningScreen extends StatefulWidget {
  const ELearningScreen({key}) : super(key: key);

  @override
  _ELearningScreenState createState() => _ELearningScreenState();
}

class _ELearningScreenState extends State<ELearningScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    final items = List<String>.generate(3, (index) => null);
    return Scaffold(
        appBar: AppBarMainScreen(),
        body: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xff7cd3f7)),
                child: Center(
                    child: Text('e-learning'.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xff13438f),
                            fontSize: 24,
                            fontWeight: FontWeight.w700))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 25),
              child: Text('all available course channels'.toUpperCase(),
                  style: TextStyle(
                      color: Color(0xff13438f),
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10) ,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side:
                                  BorderSide(color: Color(0xff7cd3f7), width: 1)),
                          child: Column(
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width - 40,
                                  height: shortestSide >= 600
                                      ? screenHeight / 3
                                      : screenHeight / 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset('assets/images/pic4.png',
                                          fit: BoxFit.cover),
                                    ),
                                  )),
                              DefaultTextStyle(
                                style: TextStyle(
                                    fontSize: shortestSide >= 600 ? 20 : 14,
                                    color: Colors.grey),
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 40,
                                  height: MediaQuery.of(context).size.height*0.35,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 25),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 15),
                                        Row(
                                          children: [
                                            Text(
                                              'Course name:',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              ' Mathematics',
                                              style: TextStyle(
                                                  color: Color(0xff7cd3f7),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          children: [
                                            Text(
                                              'Course type:',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              ' Pratical',
                                              style: TextStyle(
                                                  color: Color(0xff7cd3f7),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          children: [
                                            Text(
                                              'Teacher:',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              ' Neil',
                                              style: TextStyle(
                                                  color: Color(0xff7cd3f7),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 40),
                                        Center(
                                          child: Container(
                                            height: 40,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Color(0xff7cd3f7),
                                            ),
                                            child: TextButton(
                                              onPressed: null,
                                              child: Text('join'.toUpperCase(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18)),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
            Container(
              height: 100,
              padding: EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color(0xff7cd3f7))
                      ),
                      child: TextButton(
                          child: Text('<',style: TextStyle(color: Colors.grey,fontSize: 20),),
                          
                          onPressed: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      child: TextButton(
                          child: Text('1',style: TextStyle(color: Colors.white,fontSize: 20),),
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff7cd3f7))),
                          onPressed: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color(0xff7cd3f7))
                      ),
                      child: TextButton(
                          child: Text('2',style: TextStyle(color: Colors.grey,fontSize: 20),),
                          
                          onPressed: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color(0xff7cd3f7))
                      ),
                      child: TextButton(
                          child: Text('>',style: TextStyle(color: Colors.grey,fontSize: 20),),
                          
                          onPressed: () {},
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ));
  }
}
