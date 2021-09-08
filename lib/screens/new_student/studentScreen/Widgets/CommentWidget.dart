import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/studentScreen/Widgets/CommentDetail.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CommentList extends StatefulWidget {
  const CommentList({key}) : super(key: key);

  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  final items = List<String>.generate(10, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Card(
              color: Color(0xffebf6ff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                  contentPadding: EdgeInsets.only(left: 0.0),
                  isThreeLine: true,
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF7dd3f7),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                    width: 35,
                    height: 30,
                    child: Center(
                        child: Text(
                      '1',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                  ),
                  title: Text('Teacher comment'),
                  subtitle: Column(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('TIme: 8/19/2021 10:42')),
                      Padding(
                        padding: EdgeInsets.only(
                            right: 20.0, top: 5.0, bottom: 10.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys '
                              'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and '
                              'scrambled it to make a type specimen book. It has',
                              textAlign: TextAlign.justify,
                            )),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              pushNewScreen(
                                context,
                                screen: CommentDetail(),
                                withNavBar: true, // OPTIONAL VALUE. True by default.
                                pageTransitionAnimation: PageTransitionAnimation.cupertino,
                              );
                            },
                            child: Text(
                              'Read more',
                              style: TextStyle(
                                  color: Color(0xFF144385),
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 25,
                                  child: IconButton(
                                      padding: EdgeInsets.all(0),
                                      icon: Image.asset(
                                        'assets/images/icons/4. LIKE.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                      color: Colors.grey,
                                      onPressed: () {
                                      }),
                                ),
                                Text("0"),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 25,
                                  child: IconButton(
                                      padding: EdgeInsets.all(0),
                                      icon: Image.asset(
                                        'assets/images/icons/5. COMMENT.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                      color: Colors.grey,
                                      tooltip: 'Comment',
                                      onPressed: () {}),
                                ),
                                Text(
                                  '0 Comment',
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
