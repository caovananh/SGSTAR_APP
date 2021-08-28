import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/CardHeader.dart';

class HomeWorkDetail extends StatefulWidget {
  const HomeWorkDetail({key}) : super(key: key);

  @override
  _HomeWorkDetailState createState() => _HomeWorkDetailState();
}

class _HomeWorkDetailState extends State<HomeWorkDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(),
        body: Column(
          children: [
            CardHeader(child: Text('HOMEWORK')),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 20.0, right: 20.0, bottom: 10),
                    child: Container(
                      decoration: new BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 1,
                              blurRadius: 20,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],
                      ),
                      //height: MediaQuery.of(context).size.height,
                      child: Card(
                        color: Color(0xffebf6ff),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                "Subject: Lorem Ipsum",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('25/12/2021'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15,right: 15,bottom: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys'
                                          ' standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make '
                                          'a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, '
                                          'remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,'
                                          ' and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
                                      ,style: TextStyle(
                                        color: Colors.grey[400]
                                      ),textAlign: TextAlign.justify),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys'
                                              ' standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make '
                                              'a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, '
                                              'remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,'
                                              ' and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
                                      ,style: TextStyle(
                                          color: Colors.grey[400]
                                      ),textAlign: TextAlign.justify),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
