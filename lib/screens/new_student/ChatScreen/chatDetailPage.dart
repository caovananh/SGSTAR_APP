import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/model/chatMessageModel.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

List<ChatMessage> messages = [
  ChatMessage(
      messageContent: "dam nhau ko?",
      messageType: "receiver"),
  ChatMessage(
      messageContent: "đấm, sợ gì",
      messageType: "receiver"),
  ChatMessage(
      messageContent: "Lorem Ipsum is simply dummy text",
      messageType: "sender"),
  ChatMessage(
      messageContent:
          "Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text",
      messageType: "receiver"),
  ChatMessage(
      messageContent: "Lorem Ipsum is simply dummy text",
      messageType: "sender"),
  ChatMessage(
      messageContent: "Lorem Ipsum is simply dummy text",
      messageType: "receiver"),
  ChatMessage(
      messageContent: "Lorem Ipsum is simply dummy text",
      messageType: "receiver"),
  ChatMessage(
      messageContent: "Lorem Ipsum is simply dummy text",
      messageType: "sender"),
  ChatMessage(
      messageContent:
          "Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text",
      messageType: "receiver"),
  ChatMessage(
      messageContent: "Lorem Ipsum is simply dummy text",
      messageType: "sender"),
];

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBarWidget(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              // physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      messages[index].messageType == "receiver"
                          ? Container(
                              // padding: EdgeInsets.only(left: 10),
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                border: new Border.all(
                                  color: Color(0xFF9EDEFF),
                                  width: 1.0,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 15.0,
                                backgroundImage: AssetImage(
                                    'assets/images/icons/student1.png'),
                                backgroundColor: Colors.white,
                              ),
                            )
                          : Text(""),
                      Expanded(
                        child: Align(
                          alignment: (messages[index].messageType == "receiver"
                              ? Alignment.topLeft
                              : Alignment.topRight),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (messages[index].messageType == "receiver"
                                  ? Color(0xFFE1EBF1)
                                  : Color(0xFF9EDEFF)),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Text(
                              messages[index].messageContent,
                              style: TextStyle(
                                  fontSize: 15,
                                  color:
                                      (messages[index].messageType == "receiver"
                                          ? Colors.grey[600]
                                          : Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
            height: 60,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF9EDEFF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.picture_in_picture_alt,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.mic,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.thumb_up,
                    color: Color(0xFF9EDEFF),
                    size: 18,
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
