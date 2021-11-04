import 'dart:convert';
import 'package:flutter_summernote/flutter_summernote.dart';
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
    _asyncMethod();

    super.initState();
  }

  _asyncMethod() async {
    await getNewsContent().then((value) {
      setState(() {
        _titleController.text = newsTitle;
        _descriptionController.text = newsDescription;
      });
    });
  }

  String newsTitle;
  String newsDescription;
  String newsImage;
  String newsBody;
  String newsPublishDate;
  String idNews;
  bool hasData = false;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  GlobalKey<FlutterSummernoteState> _keyEditor = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Container(
          color: Colors.white,
          child: FutureBuilder(builder: (context, data) {
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
                          padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                          child: TextFormField(
                            controller: _titleController,
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Title'),
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
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                          child: TextFormField(
                            controller: _descriptionController,
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Description'),
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
                          padding: const EdgeInsets.only(top: 15.0, bottom: 15),
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
                            ? Image.network(
                                'https://sgstar.asia/' + newsImage.toString())
                            : Image.asset('assets/images/icons/no_image.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                    child: Container(
                        child: FlutterSummernote(
                          height: 500,
                          value: newsBody != null ? newsBody : '',
                          key: _keyEditor,
                          hasAttachment: true,
                          customToolbar: """
                          [
                            ['style', ['bold', 'italic', 'underline', 'clear']],
                            ['font', ['strikethrough', 'superscript', 'subscript']],
                            ['insert', ['link', 'table', 'hr']]
                          ]
                        """,
                        ),
                        margin: MediaQuery.of(context).viewInsets),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextButton(
                      onPressed: () async {
                        var body = await _keyEditor.currentState.getText();
                        print(body);
                        updateNews(
                            int.parse(idNews),
                            _titleController.text != ''
                                ? _titleController.text
                                : newsTitle,
                            _descriptionController.text != ''
                                ? _descriptionController.text
                                : newsDescription,
                            body != '' ? body : newsBody);

                        // showDialog(
                        //     context: context,
                        //     builder: (BuildContext context) => AlertDialog(
                        //           title: const Text('AlertDialog Title'),
                        //           content:
                        //               const Text('AlertDialog description'),
                        //           actions: <Widget>[
                        //             TextButton(
                        //               onPressed: () =>
                        //                   Navigator.pop(context, 'Cancel'),
                        //               child: const Text('Cancel'),
                        //             ),
                        //             TextButton(
                        //               onPressed: () {},
                        //               child: const Text('OK'),
                        //             ),
                        //           ],
                        //         ));
                      },
                      style: TextButton.styleFrom(
                          primary: Colors.white, backgroundColor: Colors.blue),
                      child: Text(
                        'Save',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
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

  Future<void> updateNews(
      int $id, String $title, String $description, String $newsBody) async {
    final response = await http.get(
        Uri.parse(InfixApi.updateNews($id, $title, $description, $newsBody)));
    print("success");
    //Navigator.of(context).popUntil((route) => route.isFirst);
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
        newsDescription = jsonData['data']['News']['description'];
        newsBody = jsonData['data']['News']['news_body'];
        newsPublishDate = jsonData['data']['News']['publish_date'];
        hasData = true;
      });
    }
  }
}
