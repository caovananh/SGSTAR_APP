import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/HomeScreen/Widgets/NewsComment.dart';
import 'package:infixedu/screens/new_student/HomeScreen/Widgets/NewsContent.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';

class News extends StatefulWidget {
  const News({key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<dynamic> listNews;
  bool hasData = false;
  @override
  void initState() {
    this.getNewsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    final items = List<String>.generate(3, (i) => "Item $i");
    return FutureBuilder(
        future: getNewsList(),
        builder: (context, data) {
          if (hasData != false) {
            return Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ListView.builder(
                  itemCount: listNews == null ? 0 : listNews.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width - 40,
                              height: shortestSide >= 600
                                  ? screenHeight / 3
                                  : screenHeight / 4,
                              child: FittedBox(
                                child: Image.network("https://sgstar.asia/" +
                                    listNews[index]["image"]),
                                fit: BoxFit.fill,
                              )),
                          DefaultTextStyle(
                            style: TextStyle(
                                fontSize: shortestSide >= 600 ? 20 : 14,
                                color: Colors.grey),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 40,
                              height: screenHeight / 7,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: InkWell(
                                        onTap: () {
                                          saveId(
                                              listNews[index]["id"].toString());
                                          pushNewScreen(
                                            context,
                                            screen: NewsContent(),
                                            withNavBar:
                                                true, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation:
                                                PageTransitionAnimation
                                                    .cupertino,
                                          );
                                        },
                                        child: Text(
                                          listNews[index]["description"],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(listNews[index]["publish_date"],
                                        style: TextStyle(color: Colors.grey)),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 0),
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  90) /
                                              3,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 25,
                                                child: IconButton(
                                                    padding: EdgeInsets.all(0),
                                                    icon: Image.asset(
                                                      'assets/images/icons/4. LIKE.png',
                                                      width: 25,
                                                      height: 25,
                                                    ),
                                                    color: Colors.grey,
                                                    onPressed: () {
                                                      storeLike(listNews[index]
                                                          ["id"]);
                                                    }),
                                              ),
                                              Text(listNews[index]
                                                  ["like_count"]),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  30) /
                                              3,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 25,
                                                child: IconButton(
                                                    padding: EdgeInsets.all(0),
                                                    icon: Image.asset(
                                                      'assets/images/icons/5. COMMENT.png',
                                                      width: 25,
                                                      height: 25,
                                                    ),
                                                    color: Colors.grey,
                                                    tooltip: 'Comment',
                                                    onPressed: () {
                                                      saveId(listNews[index]
                                                              ["id"]
                                                          .toString());
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const NewsComment()),
                                                      );
                                                    }),
                                              ),
                                              Text(
                                                '0 Comment',
                                                textAlign: TextAlign.right,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  90) /
                                              3,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 25,
                                                child: IconButton(
                                                    padding: EdgeInsets.all(0),
                                                    icon: Image.asset(
                                                      'assets/images/icons/6. SHARE.png',
                                                      width: 25,
                                                      height: 25,
                                                    ),
                                                    color: Colors.grey,
                                                    onPressed: () {
                                                      Share.share(
                                                          'https://sgstar.asia/news-list/' +
                                                              listNews[index]
                                                                      ["id"]
                                                                  .toString());
                                                    }),
                                              ),
                                              Text('0 Share'),
                                            ],
                                          ),
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
                    );
                  },
                ));
          } else {
            return Container(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()));
          }
        });
  }

  Future<String> getNewsList() async {
    final pref = await SharedPreferences.getInstance();
    String classId = pref.get('class_id');
    final response = await http.get(Uri.parse(InfixApi.getNewsList(int.parse(classId))));
    Map<String, dynamic> map = json.decode(response.body);
    setState(() {
      listNews = map["data"]["News"];
      hasData = true;
    });
    return "Success!";
  }

  Future<void> storeLike(int $id) async {
    final response = await http.get(Uri.parse(InfixApi.likeNews($id)));
    getNewsList();
    print("Success!");
  }

  void saveId(String $id) {
    saveStringValue('NewsId', $id);
  }

  Future<bool> saveStringValue(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }
}
