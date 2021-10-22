import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/ChatScreen/chatDetailPage.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarMainScreen.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/CardHeader.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/FloatingButtons.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/FloatingChat.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/model/Child.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  List<dynamic> listRoom;
  final items = List<String>.generate(5, (i) => "Item $i");

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    getChatRoom();
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    mediaQueryData.size.width;
    mediaQueryData.size.height;
    return Scaffold(
      appBar: AppBarMainScreen(),
      body: Container(
        color: Colors.white,
        child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                CardHeader(child: Text('chat'.toUpperCase())),
                SizedBox(
                  height: 20,
                ),
                TabBar(
                    unselectedLabelColor: Color(0xFF144385),
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Colors.white,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFF9EDEFF)),
                    tabs: [
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: Color(0xFF9EDEFF), width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "CLASS GROUP",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: Color(0xFF9EDEFF), width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("TEACHER",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: TabBarView(children: [
                    Column(
                      children: [
                        Flexible(
                          flex: 9,
                          fit: FlexFit.loose,
                          child: ListView.builder(
                              itemCount: listRoom == null ? 0 : listRoom.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      top: mediaQueryData.size.height * 0.03,
                                      left: 20,
                                      right: 20),
                                  child: Container(
                                    height: mediaQueryData.size.height * 0.2,
                                    padding: EdgeInsets.all(
                                        mediaQueryData.size.height * 0.02),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      border: Border.all(
                                          color: Color(
                                              0xFF9EDEFF), // Set border color
                                          width: 1.0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          listRoom[index]["name"].toUpperCase(),
                                          style: TextStyle(
                                            color: Color(0xFF144385),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "20 second ago",
                                              style: TextStyle(
                                                  color: Colors.grey[400]),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  pushNewScreen(
                                                    context,
                                                    screen: ChatDetailPage(
                                                        roomId: listRoom[index]
                                                            ["id"],
                                                        userId_1: int.parse(
                                                            listRoom[index]
                                                                ["user_id_1"]),
                                                        userId_2: int.parse(
                                                            listRoom[index]
                                                                ["user_id_2"])),
                                                    withNavBar:
                                                        false, // OPTIONAL VALUE. True by default.
                                                    pageTransitionAnimation:
                                                        PageTransitionAnimation
                                                            .cupertino,
                                                  );
                                                },
                                                child: Text(
                                                  "JOIN",
                                                  style: TextStyle(
                                                      color: Color(0xFF9EDEFF)),
                                                ),
                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<
                                                            RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18.0),
                                                            side: BorderSide(
                                                                color: Color(
                                                                    0xFF9EDEFF))))))
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
                    Column(
                      children: [
                        Flexible(
                          flex: 4,
                          fit: FlexFit.loose,
                          child: ListView.builder(
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      top: mediaQueryData.size.height * 0.03,
                                      left: 20,
                                      right: 20),
                                  child: Container(
                                    height: mediaQueryData.size.height * 0.2,
                                    padding: EdgeInsets.all(
                                        mediaQueryData.size.height * 0.02),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      border: Border.all(
                                          color: Color(
                                              0xFF9EDEFF), // Set border color
                                          width: 1.0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "20 second ago",
                                              style: TextStyle(
                                                  color: Colors.grey[400]),
                                            ),
                                            FlatButton(
                                              onPressed: () {},
                                              child: Text(
                                                "JOIN",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              color: Color(0xFF9EDEFF),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                  side: BorderSide(
                                                      color:
                                                          Color(0xFF9EDEFF))),
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
                  ]),
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingChat(),
    );
  }

  Future<String> getChatRoom() async {
    final pref = await SharedPreferences.getInstance();
    String id = pref.get('id');

    final response =
        await http.get(Uri.parse(InfixApi.chatRoom(int.parse(id))));
    Map<String, dynamic> map = json.decode(response.body);
    setState(() {
      listRoom = map["data"]["chatRoom"];
    });
    //print(listRoom);
    return "Success!";
  }
}
