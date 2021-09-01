import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class News extends StatefulWidget {
  const News({key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<dynamic> listNews;
  void initState() {
    this.getNewsList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
  
    final items = List<String>.generate(3, (i) => "Item $i");
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: listNews==null? 0:listNews.length,
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
                        child: Image.network("https://sgstar.asia/"+ listNews[index]["image"]),
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
                              child: Text(
                                listNews[index]["description"].substring(0,60),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(listNews[index]["publish_date"],
                                style: TextStyle(color: Colors.grey)),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 0),
                                  width:
                                      (MediaQuery.of(context).size.width - 90) /
                                          3,
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
                                            onPressed: () {}),
                                      ),
                                      Text('0 '),
                                    ],
                                  ),
                                ),
                                Container(
                                  width:
                                      (MediaQuery.of(context).size.width - 30) /
                                          3,
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
                                Container(
                                  width:
                                      (MediaQuery.of(context).size.width - 90) /
                                          3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 25,
                                        child: IconButton(
                                            padding: EdgeInsets.all(0),
                                            icon: Image.asset(
                                              'assets/images/icons/6. SHARE.png',
                                              width: 20,
                                              height: 20,
                                            ),
                                            color: Colors.grey,
                                            onPressed: () {}),
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
  }
  Future<String> getNewsList() async{

    final response = await http.get(Uri.parse(InfixApi.getNewsList()));
    Map<String, dynamic> map = json.decode(response.body);
    setState(() {
      listNews = map["data"]["News"];
    });
    print(listNews);

    return "Success!";
  }
}
