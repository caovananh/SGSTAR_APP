import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/CardHeader.dart';

class CommentDetail extends StatefulWidget {
  const CommentDetail({key}) : super(key: key);

  @override
  _CommentDetailState createState() => _CommentDetailState();
}

class _CommentDetailState extends State<CommentDetail> {
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
                                "Teacher comment",
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
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              IconButton(
                                                  icon: Image.asset('assets/images/icons/4. LIKE.png'),
                                                  color: Colors.grey,
                                                  tooltip: 'Like',
                                                  onPressed: () {}
                                                  ),
                                              Text('0')
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                  icon: Image.asset('assets/images/icons/5. COMMENT.png'),
                                                  color: Colors.grey,
                                                  tooltip: 'Comments',
                                                  onPressed: () {}),
                                              Text('1 ',style: TextStyle(color: Color(0xFF144385)),),
                                              Text('Comment',style: TextStyle(color: Color(0xFF144385)),)
                                            ],
                                          ),
                                        ],
                                      ),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                        child: Text('Parents comment',style: TextStyle(
                            color: Color(0xFF144385),
                            fontWeight: FontWeight.bold),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          border: Border.all(
                              color: Color(0xFF9EDEFF), // Set border color
                              width: 1.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(30.0),
                            child: Text('Contrary to popular belief, Lorem Ipsum')),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
