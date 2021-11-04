import 'dart:convert';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
//import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EditNews extends StatefulWidget {
  const EditNews({key}) : super(key: key);

  @override
  _EditNewsState createState() => _EditNewsState();
}

class _EditNewsState extends State<EditNews> {
  @override
  void initState() {
    getContent = getNewsContent();
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
  TextEditingController titleController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Container(
          color: Colors.white,
          child: FutureBuilder(
              future: getContent,
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
                              padding:
                                  const EdgeInsets.only(top: 15.0, bottom: 15),
                              child: TextField(
                                controller: titleController,
                                decoration: new InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText:
                                        newsTitle != null ? newsTitle : ''),
                              ),
                            ),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextButton(
                          onPressed: () {
                            updateNews(int.parse(idNews), titleController.text);
                          },
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.blue),
                          child: Text(
                            'Save',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
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

  Future<void> updateNews(int $id, String $title) async {
    final response =
        await http.get(Uri.parse(InfixApi.updateNews($id, $title)));
    print("Success!");
  }

  Future<void> getNewsContent() async {
    final pref = await SharedPreferences.getInstance();
    String newIds = pref.get('NewsId');
    idNews = newIds;
    final response =
        await http.get(Uri.parse(InfixApi.getNewsContent(int.parse(idNews))));
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
