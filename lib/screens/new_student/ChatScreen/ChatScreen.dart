import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/ChatScreen/chatDetailPage.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final items = List<String>.generate(5, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    mediaQueryData.size.width;
    mediaQueryData.size.height;
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: mediaQueryData.size.height * 0.03,
                left: mediaQueryData.size.width * 0.08,
                right: mediaQueryData.size.width * 0.08),
            child: Container(
              width: mediaQueryData.size.width * 1,
              height: mediaQueryData.size.height * 0.07,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
                color: Color(0xFF9EDEFF),
                borderRadius: BorderRadius.circular(
                  45.0,
                ),
              ),
              child: Center(
                child: Text(
                  'chat'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF144385),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: mediaQueryData.size.height * 0.01,
                left: mediaQueryData.size.width * 0.08,
                right: mediaQueryData.size.width * 0.08),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "search".toUpperCase(),
                hintStyle: TextStyle(
                  color: Color(0xFF144385),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: mediaQueryData.size.height * 0.01,
                  left: mediaQueryData.size.width * 0.08,
                  right: mediaQueryData.size.width * 0.08),
              child: Text(
                "CLASS GROUP",
                style: TextStyle(
                  color: Color(0xFF144385),
                  fontWeight: FontWeight.bold,
                ),
              )),
          Flexible(
            flex: 5,
            fit: FlexFit.loose,
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: mediaQueryData.size.height * 0.03,
                        left: mediaQueryData.size.width * 0.08,
                        right: mediaQueryData.size.width * 0.08),
                    child: Container(
                      height: mediaQueryData.size.height * 0.2,
                      padding:
                          EdgeInsets.all(mediaQueryData.size.height * 0.02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        border: Border.all(
                            color: Color(0xFF9EDEFF), // Set border color
                            width: 1.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Year 1N".toUpperCase(),
                            style: TextStyle(
                              color: Color(0xFF144385),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "20 second ago",
                                style: TextStyle(color: Colors.grey[400]),
                              ),
                              FlatButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ChatDetailPage();
                                  }));
                                },
                                child: Text(
                                  "JOIN",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Color(0xFF9EDEFF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Color(0xFF9EDEFF))),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: mediaQueryData.size.height * 0.02,
                  left: mediaQueryData.size.width * 0.08,
                  right: mediaQueryData.size.width * 0.08),
              child: Text(
                "TEACHER",
                style: TextStyle(
                  color: Color(0xFF144385),
                  fontWeight: FontWeight.bold,
                ),
              )),
          Flexible(
            flex: 4,
            fit: FlexFit.loose,
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: mediaQueryData.size.height * 0.03,
                        left: mediaQueryData.size.width * 0.08,
                        right: mediaQueryData.size.width * 0.08),
                    child: Container(
                      height: mediaQueryData.size.height * 0.2,
                      padding:
                          EdgeInsets.all(mediaQueryData.size.height * 0.02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        border: Border.all(
                            color: Color(0xFF9EDEFF), // Set border color
                            width: 1.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Year 1N".toUpperCase(),
                            style: TextStyle(
                              color: Color(0xFF144385),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "20 second ago",
                                style: TextStyle(color: Colors.grey[400]),
                              ),
                              FlatButton(
                                onPressed: () {},
                                child: Text(
                                  "JOIN",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Color(0xFF9EDEFF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Color(0xFF9EDEFF))),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
