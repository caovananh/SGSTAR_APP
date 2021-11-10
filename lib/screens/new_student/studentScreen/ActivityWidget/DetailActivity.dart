import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DetailActivity extends StatefulWidget {
  final id;
  const DetailActivity({key, this.id}) : super(key: key);

  @override
  _DetailActivityState createState() => _DetailActivityState();
}

class _DetailActivityState extends State<DetailActivity> {
  @override
  void initState() {
    print(widget.id);
    // getNewsContent();
    // getContent = getNewsContent();
    super.initState();
  }

  Future<void> getContent;
  String newsTitle;
  String newsDescription;
  String newsImage;
  String newsBody;
  String newsPublishDate;
  String idNews;
  bool hasData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Container(
          color: Colors.white,
          child: FutureBuilder(
              future: getNewsContent(),
              builder: (context, data) {
                if (hasData != false) {
                  return ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 20.0, right: 20.0, bottom: 5.0),
                        child: Container(
                          width: double.infinity,
                          child: Center(
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, bottom: 15),
                                child: Text(newsTitle != null ? newsTitle : "",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff07509d)))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 20.0, right: 20.0, bottom: 5.0),
                        child: Container(
                          width: double.infinity,
                          child: Padding(
                              padding:
                              const EdgeInsets.only(top: 15.0, bottom: 15),
                              child: Text(
                                  newsPublishDate != null
                                      ? "Publish date: " + newsPublishDate
                                      : "",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black26))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 20.0, right: 20.0, bottom: 20.0),
                        child: Container(
                          width: double.infinity,
                          child: Center(
                            child: newsImage != null
                                ? Image.network('https://sgstar.asia/' +
                                newsImage.toString())
                                : Image.asset(
                                'assets/images/icons/no_image.png'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 20.0, right: 20.0, bottom: 5.0),
                        child: Container(
                          width: double.infinity,
                          child: Center(
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, bottom: 15),
                                child: HtmlWidget(
                                  newsBody != null ? newsBody : "",
                                )

                              // print(document.outerHtml),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container(
                      color: Colors.white,
                      child: Center(child: CircularProgressIndicator()));
                }
              })),
    );
  }

  Future<void> getNewsContent() async {
    final pref = await SharedPreferences.getInstance();
    String newIds = pref.get('NewsId');
    idNews = newIds;

    final response =
    await http.get(Uri.parse(InfixApi.getNewsContent(widget.id)));
    var jsonData = json.decode(response.body);
    if (mounted) {
      setState(() {
        newsTitle = jsonData['data']['News']['news_title'];
        newsImage = jsonData['data']['News']['image'];
        newsBody = jsonData['data']['News']['news_body'];
        newsPublishDate = jsonData['data']['News']['publish_date'];
        hasData = true;
      });
    }
  }
}