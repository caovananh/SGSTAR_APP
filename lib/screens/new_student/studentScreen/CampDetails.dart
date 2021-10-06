import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fwfh_chewie/fwfh_chewie.dart';

class CampDetails extends StatefulWidget {
  const CampDetails(this.id, {Key key}) : super(key: key);
  final int id;
  @override
  _CampDetailsState createState() => _CampDetailsState();
}

class _CampDetailsState extends State<CampDetails> {
  Future<void> getContent;
  String newsTitle;
  String newsDescription;
  String newsImage;
  String newsBody;
  String newsPublishDate;
  String idNews;
  bool hasData = false;

  @override
  void initState() {
    getNewsContent();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: Container(
        color: Colors.white,
        child: ListView(

          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff07509d),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ]),
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                      child: Text(newsTitle!=null?newsTitle.toUpperCase():'',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff)))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child:
                      newsImage != null
                          ? Image.network('https://sgstar.asia/' +
                          newsImage.toString())
                          : Image.asset(
                          'assets/images/icons/summer_camp.png')),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            child: HtmlWidget(
                              newsBody != null ? newsBody : "",
                            )

                          // print(document.outerHtml),
                        ),
                      ),
                    ),
                  ),
                  Container(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getNewsContent() async {

    final response =
    await http.get(Uri.parse(InfixApi.getNewsContent((this.widget.id))));
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
    print(jsonData['data']);
  }
}
