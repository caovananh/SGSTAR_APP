import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/ChatScreen/ChatScreen.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/model/chatMessageModel.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class ChatDetailPage extends StatefulWidget {
  final int roomId;
  final int userId_1;
  final int userId_2;
  const ChatDetailPage({key, this.roomId, this.userId_1,this.userId_2}) : super(key: key);
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  int sender;
  int receive;
  int idRoomChat;
  bool isFocus = false;
  final messageDb = FirebaseDatabase.instance.reference().child("messages").orderByChild('roomId');
  FocusNode _focus = new FocusNode();
  final textController = TextEditingController();
  final dataBaseReference = FirebaseDatabase.instance.reference();
  final db = FirebaseDatabase.instance.reference().child("messages");
  void initState() {
    idStudent=getStudentId();
    idRoomChat=widget.roomId;

    final Future<FirebaseApp> _future = Firebase.initializeApp();
    super.initState();
  }

  int idStudent;


  void addData(String data) async {
    var now = DateTime.now().toUtc();
    final convertLocal = now.toLocal();
    // DateFormat dateFormat = DateFormat("HH:mm  dd/MM/yyyy");
    // dynamic currentTime = dateFormat.format(convertLocal);
    // print(currentTime);



    final pref = await SharedPreferences.getInstance();
    String id = pref.get('id');

    if(widget.userId_1==int.parse(id))
      {
        setState(() {
          sender=int.parse(id);
          receive=widget.userId_2;
        });
      }
    else if(widget.userId_2==int.parse(id))
      {
        setState(() {
          sender=int.parse(id);
          receive=widget.userId_1;
        });
      }

    db.push().set({
      'content': data,
      'IdFrom': sender,
      'IdTo': receive,
      'roomId': widget.roomId,
      'dateTime': DateFormat.Hm().add_yMMMd().format(convertLocal)
    });
  }
  int getStudentId() {
    Utils.getStringValue('id').then((value) {
      setState(() {
        idStudent = int.parse(value);
      });
    });
    return idStudent;
  }


  void _onFocusChange() {
    setState(() {
      isFocus = true;
    });
    print('focus');
  }

  @override


  Widget _message({Map messages}) {
    return Container(
      padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      child: Row(
        children: [
          messages['IdFrom'] != idStudent
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
                    backgroundImage:
                        AssetImage('assets/images/icons/student1.png'),
                    backgroundColor: Colors.white,
                  ),
                )
              : Text(""),
          SizedBox(width: 10.0),
          Expanded(
            child: Align(
              alignment: (messages['IdFrom'] != idStudent
                  ? Alignment.topLeft
                  : Alignment.topRight),
              child: Column(
                crossAxisAlignment: messages['IdFrom']!= idStudent? CrossAxisAlignment.start : CrossAxisAlignment.end,

                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: (messages['IdFrom'] != idStudent
                          ? Color(0xFFE1EBF1)
                          : Color(0xFF9EDEFF)),
                    ),
                    padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                    child: Text(
                      messages['content'],
                      style: TextStyle(
                          fontSize: 15,
                          color: (messages['IdFrom'] != idStudent
                              ? Colors.grey[600]
                              : Colors.white)),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(messages['dateTime'],style: TextStyle(
                    fontSize: 10
                  ),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBarWidget(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FirebaseAnimatedList(
              query: messageDb.equalTo(idRoomChat),
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map test = snapshot.value;
                return _message(messages: test);
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
                    onTap: () {
                      _onFocusChange();
                    },
                    focusNode: _focus,
                    controller: textController,
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
                isFocus ? showSendButton() : showLikeButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showSendButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          isFocus = false;
          addData(textController.text);
          print(textController.text);
          textController.clear();
        });
      },
      child: Icon(
        Icons.send,
        color: Color(0xFF9EDEFF),
        size: 18,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget showLikeButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(
        Icons.thumb_up,
        color: Color(0xFF9EDEFF),
        size: 18,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
