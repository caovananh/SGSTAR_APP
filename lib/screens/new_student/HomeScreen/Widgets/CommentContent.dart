import 'dart:convert';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CommentContent extends StatefulWidget {
  const CommentContent({key}) : super(key: key);

  @override
  _CommentStateContent createState() => _CommentStateContent();
}

class _CommentStateContent extends State<CommentContent> {
  TextEditingController commentController = TextEditingController();
  final items = List<String>.generate(35, (i) => "Item $i");
  List<dynamic> listComment;
  String idNews;
  bool emojiStatus = false;
  FocusNode focusNode = FocusNode();
  Icon emojiIcon = Icon(Icons.emoji_emotions_outlined);
  @override
  void initState() {
    getNewsComment();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          emojiStatus = false;
          emojiIcon = Icon(Icons.emoji_emotions_outlined);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: RefreshIndicator(
          onRefresh: getNewsComment,
          child: ListView.builder(
              itemCount: listComment == null ? 0 : listComment.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding:
                      EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Container(
                        // padding: EdgeInsets.only(left: 10),
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          border: new Border.all(
                            color: Color(0xFF9EDEFF),
                            width: 1.0,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 25.0,
                          backgroundImage: listComment[index]
                                      ['student_photo'] !=
                                  null
                              ? NetworkImage('https://sgstar.asia/' +
                                  listComment[index]['student_photo']
                                      .toString())
                              : AssetImage('assets/images/icons/student1.png'),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFF9EDEFF),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listComment[index]['full_name'] != null
                                      ? listComment[index]['full_name']
                                      : '',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  listComment[index]['comment_content'] != null
                                      ? listComment[index]['comment_content']
                                      : '',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        )),
        Divider(),
        ListTile(
          leading: showEmoji(),
          title: TextFormField(
            focusNode: focusNode,
            maxLines: null,
            controller: commentController,
            decoration: InputDecoration(labelText: "Write a comment..."),
          ),
          trailing: IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              storeComment();
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        emojiStatus ? showEmojiPicker() : Container(),
        Divider()
      ],
    );
  }

  Future<String> getNewsComment() async {
    final pref = await SharedPreferences.getInstance();
    String newIds = pref.get('NewsId');
    String userId = pref.get('id');
    idNews = newIds;
    final response = await http
        .get(Uri.parse(InfixApi.getCommentContent(int.parse(idNews))));
    Map<String, dynamic> map = json.decode(response.body);
    setState(() {
      listComment = map["data"]["commentContent"];
      // hasData=true;
    });
    //print(listComment);
    return "Success!";
  }

  Future<void> storeComment() async {
    final pref = await SharedPreferences.getInstance();
    String newIds = pref.get('NewsId');
    String userId = pref.get('id');
    final response = await http.get(Uri.parse(InfixApi.storeCommentNews(
        int.parse(newIds), int.parse(userId), commentController.text)));
    commentController.clear();
    getNewsComment();
    print("Success!");
  }

  Widget showEmojiPicker() {
    return EmojiPicker(
      rows: 3,
      columns: 7,
      numRecommended: 10,
      onEmojiSelected: (emoji, category) {
        commentController.text = commentController.text + emoji.emoji;
      },
    );
  }

  Widget showEmoji() => Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: IconButton(
          onPressed: () {
            focusNode.unfocus();
            focusNode.canRequestFocus = false;
            setState(() {
              emojiStatus = !emojiStatus;
              emojiIcon = Icon(Icons.keyboard);
            });
          },
          icon: emojiIcon,
        ),
      );
}
