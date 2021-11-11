import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'package:infixedu/screens/new_student/HomeScreen/Widgets/NewsComment.dart';
import 'package:infixedu/screens/new_student/HomeScreen/Widgets/NewsContent.dart';
import 'package:infixedu/screens/new_student/HomeScreen/Widgets/blockUser.dart';
import 'package:infixedu/screens/new_student/HomeScreen/Widgets/editNews.dart';
import 'package:infixedu/screens/new_student/studentScreen/studentPostScreen.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'dart:async';

class News extends StatefulWidget {
  const News({key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<dynamic> listNews;
  bool hasData = false;
  String classId;

  int role;
  @override
  void initState() {
    this.getRole();
    this.getNewsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var url = "";
    final double screenHeight = MediaQuery.of(context).size.height;
    _save() async {
      var status = await Permission.storage.request();
      if (status.isGranted) {
        var response = await Dio()
            .get(url, options: Options(responseType: ResponseType.bytes));
        final result = await ImageGallerySaver.saveImage(
            Uint8List.fromList(response.data),
            quality: 60,
            name: "hello");
        print(result);
      }
    }

    var shortestSide = MediaQuery.of(context).size.shortestSide;

    final items = List<String>.generate(3, (i) => "Item $i");
    return RefreshIndicator(
      onRefresh: getNewsList,
      child: FutureBuilder(
          future: getNewsList(),
          builder: (context, data) {
            if (hasData != false) {
              return Container(
                height: screenHeight / 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: IconButton(
                            onPressed: () => showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2999),
                              builder: (BuildContext context, Widget child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                      primaryColor: const Color(0xff7cd3f7),
                                      //Head background
                                      accentColor: const Color(
                                          0xff7cd3f7) //selection color
                                      //dialogBackgroundColor: Colors.white,//Background color
                                      ),
                                  child: child,
                                );
                              },
                            ),
                            icon: Icon(Icons.calendar_today),
                            color: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: IconButton(
                              onPressed: () => showModalBottomSheet<void>(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    backgroundColor: Colors.white,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                          height: screenHeight / 4,
                                          child: Column(
                                            children: [
                                              TextButton(
                                                  onPressed: () => pushNewScreen(
                                                      context,
                                                      screen:
                                                          StudentPostScreen()),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(Icons.edit),
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      Text('Post Student Work'),
                                                    ],
                                                  )),
                                              TextButton(
                                                  onPressed: null,
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.lightbulb),
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      Text('Assign Activity'),
                                                    ],
                                                  )),
                                              TextButton(
                                                  onPressed: null,
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.chat_outlined),
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      Text('Send Announcement'),
                                                    ],
                                                  )),
                                            ],
                                          ));
                                    },
                                  ),
                              icon: Icon(Icons.add_circle_outline,
                                  size: 28, color: Colors.blue)),
                        )
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        itemCount: listNews == null ? 0 : listNews.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      height: shortestSide >= 600
                                          ? screenHeight / 3
                                          : screenHeight / 4,
                                      child: FittedBox(
                                        child: Image.network(
                                            "https://sgstar.asia/" +
                                                listNews[index]["image"]),
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                Expanded(
                                  child: DefaultTextStyle(
                                    style: TextStyle(
                                        fontSize: shortestSide >= 600 ? 20 : 14,
                                        color: Colors.grey),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      height: screenHeight / 6,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: InkWell(
                                                onTap: () {
                                                  saveId(listNews[index]["id"]
                                                      .toString());
                                                  pushNewScreen(
                                                    context,
                                                    screen: NewsContent(),
                                                    withNavBar: true,
                                                    // OPTIONAL VALUE. True by default.
                                                    pageTransitionAnimation:
                                                        PageTransitionAnimation
                                                            .cupertino,
                                                  );
                                                },
                                                child: Text(
                                                  listNews[index]
                                                      ["description"],
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                listNews[index]["publish_date"],
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                            Row(
                                              children: [
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(left: 0),
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          90) /
                                                      3,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 25,
                                                        child: IconButton(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0),
                                                            icon: Image.asset(
                                                              'assets/images/icons/4. LIKE.png',
                                                              width: 25,
                                                              height: 25,
                                                            ),
                                                            color: Colors.grey,
                                                            onPressed: () {
                                                              storeLike(
                                                                  listNews[
                                                                          index]
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
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 25,
                                                        child: IconButton(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0),
                                                            icon: Image.asset(
                                                              'assets/images/icons/5. COMMENT.png',
                                                              width: 25,
                                                              height: 25,
                                                            ),
                                                            color: Colors.grey,
                                                            tooltip: 'Comment',
                                                            onPressed: () {
                                                              saveId(listNews[
                                                                          index]
                                                                      ["id"]
                                                                  .toString());
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const NewsComment()),
                                                              );
                                                            }),
                                                      ),
                                                      Text(
                                                        listNews[index][
                                                                "comment_count"] +
                                                            ' Comment',
                                                        textAlign:
                                                            TextAlign.right,
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
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 25,
                                                        child: IconButton(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0),
                                                            icon: Image.asset(
                                                              'assets/images/icons/6. SHARE.png',
                                                              width: 25,
                                                              height: 25,
                                                            ),
                                                            color: Colors.grey,
                                                            onPressed: () {
                                                              Share.share('https://sgstar.asia/news-list/' +
                                                                  listNews[index]
                                                                          ["id"]
                                                                      .toString());
                                                            }),
                                                      ),
                                                      Text(' Share'),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            role != 4
                                                ? Container()
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        height: 25,
                                                        child: IconButton(
                                                            onPressed: () =>
                                                                showModalBottomSheet<
                                                                    void>(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xffd6d2d2),
                                                                  context:
                                                                      context,
                                                                  isScrollControlled: true,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return Container(
                                                                        height: MediaQuery.of(context).size.height * 0.60,
                                                                        child:
                                                                            ListView(
                                                                              shrinkWrap: true,
                                                                          children: [
                                                                            Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
                                                                              child: TextButton(
                                                                                  onPressed: () {
                                                                                    Navigator.of(context).pop();
                                                                                    showDialog(
                                                                                      context: context,
                                                                                      builder: (BuildContext context) {
                                                                                        return AlertDialog(
                                                                                          title: const Text('Delete Post'),
                                                                                          content: SingleChildScrollView(
                                                                                            child: ListBody(
                                                                                              children: <Widget>[
                                                                                                Text('Do you want to delete this post?'),
                                                                                                // Text(listNews[index]["id"].toString())
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          actions: <Widget>[
                                                                                            Row(
                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                              children: [
                                                                                                TextButton(
                                                                                                  child: const Text('Cancel'),
                                                                                                  onPressed: () {
                                                                                                    Navigator.of(context).pop();
                                                                                                  },
                                                                                                ),
                                                                                                TextButton(
                                                                                                  child: const Text('Accept'),
                                                                                                  onPressed: () {
                                                                                                    deletePost(listNews[index]["id"]);
                                                                                                    Navigator.of(context).pop();
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    child: Text('Delete Post'),
                                                                                  )),
                                                                            ),
                                                                            Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  saveId(listNews[index]["id"].toString());
                                                                                  pushNewScreen(
                                                                                    context,
                                                                                    screen: EditNews(),
                                                                                    withNavBar: true,
                                                                                    // OPTIONAL VALUE. True by default.
                                                                                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                                                                  );
                                                                                },
                                                                                child: Container(
                                                                                  height: 50,
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      "Edit Post",
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
                                                                              child: TextButton(
                                                                                  onPressed: () {
                                                                                    pinTop(listNews[index]["id"]);
                                                                                    Navigator.of(context).pop();
                                                                                  },
                                                                                  child: Text('Pin To Top')),
                                                                            ),
                                                                            Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
                                                                              child: TextButton(
                                                                                  onPressed: () {
                                                                                    Navigator.push(
                                                                                      context,
                                                                                      MaterialPageRoute(builder: (context) => BlockUser(id: listNews[index]["id"])),
                                                                                    );
                                                                                  },
                                                                                  child: Text('Edit People')),
                                                                            ),
                                                                            Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
                                                                              child: TextButton(
                                                                                  onPressed: () {
                                                                                    setState(() {
                                                                                      url = "https://sgstar.asia/" + listNews[index]["image"];
                                                                                    });
                                                                                    _save();
                                                                                  },
                                                                                  child: Text('Save')),
                                                                            ),
                                                                            Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
                                                                              child: TextButton(onPressed: null, child: Text('Print with QR Code')),
                                                                            ),
                                                                            Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
                                                                              child: TextButton(
                                                                                  onPressed: () {
                                                                                    Navigator.of(context).pop();
                                                                                  },
                                                                                  child: Text('Cancel')),
                                                                            ),
                                                                          ],
                                                                        ));
                                                                  },
                                                                ),
                                                            icon: Icon(
                                                              Icons
                                                                  .pending_outlined,
                                                              size: 30,
                                                              color:
                                                                  Colors.grey,
                                                            )),
                                                      ),
                                                    ],
                                                  )
                                          ],
                                        ),
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
                  ],
                ),
              );
            } else {
              return Container(
                  color: Colors.white,
                  child: Center(child: CircularProgressIndicator()));
            }
          }),
    );
  }

  int getRole() {
    Utils.getStringValue('rule').then((value) {
      setState(() {
        role = int.parse(value);
      });
    });
    return role;
  }

  Future<String> getNewsList() async {
    final pref = await SharedPreferences.getInstance();
    String classId = pref.get('class_id');
    String userId = pref.get('id');
    String rule = pref.get('rule');

    if (int.parse(rule) == 2) {
      final response =
          await http.get(Uri.parse(InfixApi.getNewsList(int.parse(classId))));
      Map<String, dynamic> map = json.decode(response.body);
      setState(() {
        listNews = map["data"]["News"];
        hasData = true;
      });
    } else if (int.parse(rule) == 4) {
      final response =
          await http.get(Uri.parse(InfixApi.getTeacherInfo(int.parse(userId))));
      var jsonData = json.decode(response.body);

      final responseData = await http.get(Uri.parse(InfixApi.getNewsList(
          int.parse(jsonData["data"]["teacher"]["class_id"]))));
      Map<String, dynamic> map = json.decode(responseData.body);
      //print(jsonData['data']['student_detail']);
      if (mounted) {
        setState(() {
          listNews = map["data"]["News"];
          hasData = true;
        });
      }
    }
    return "Success!";
  }

  Future<void> storeLike(int $id) async {
    final response = await http.get(Uri.parse(InfixApi.likeNews($id)));
    getNewsList();
    print("Success!");
  }

  Future<void> deletePost(int $id) async {
    final response = await http.get(Uri.parse(InfixApi.deletePost($id)));
    getNewsList();
    print("Success!");
  }

  Future<void> pinTop(int $id) async {
    final response = await http.get(Uri.parse(InfixApi.pinTop($id)));
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
