import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:infixedu/utils/apis/Apis.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({key}) : super(key: key);
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  String name;
  // ignore: non_constant_identifier_names
  List<dynamic> ImageList;
  bool hasData = false;
  @override
  void initState() {
    name = getName();
    this.getPhotoAlbum();
    super.initState();
  }

  int _currentIndex = 0;
  final List<String> imagesList = [
    "https://sgstar.edu.vn/public/images/pic3.png",
    "https://sgstar.edu.vn/public/images/pic4.png",
    "https://sgstar.edu.vn/public/images/pic4.png",
    "https://sgstar.edu.vn/public/images/pic4.png",
    "https://sgstar.edu.vn/public/images/pic4.png",
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    double imgHeight = screenHeight * 0.15;

    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: ListView(
          children: [
            Center(
              child: Container(
                width: double.infinity,
                child: new Text(
                  "photo album".toUpperCase(),
                  style: new TextStyle(
                    color: Color(0Xff13438f),
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
                  color: Color(0xff7cd3f7),
                ),
                padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      //                    <--- top side
                      color: Color(0xff7cd3f7),
                      width: 2.0,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('album name'.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xff13438f),
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                    Text('1',
                        style: TextStyle(
                            color: Color(0xff13438f),
                            fontSize: 18,
                            fontWeight: FontWeight.w700))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(imagesList.first)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Center(
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        enableInfiniteScroll: true,
                        height: imgHeight,
                        aspectRatio: 0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        viewportFraction: 0.6,
                        enlargeCenterPage: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                      ),
                      items: imagesList
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Image.network(e, fit: BoxFit.cover)
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: map<Widget>(imagesList, (index, url) {
                        return Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? Colors.blueAccent
                                : Colors.grey,
                          ),
                        );
                      }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Color(0xff7cd3f7))),
                            child: TextButton(
                              child: Text(
                                '<',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 20),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            width: 40,
                            height: 40,
                            child: TextButton(
                              child: Text(
                                '1',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xff7cd3f7))),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Color(0xff7cd3f7))),
                            child: TextButton(
                              child: Text(
                                '2',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 20),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Color(0xff7cd3f7))),
                            child: TextButton(
                              child: Text(
                                '>',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 20),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String getName() {
    Utils.getStringValue('full_name').then((value) {
      setState(() {
        name = value;
      });
    });
    return name;
  }

  Future<String> getPhotoAlbum() async {
    final response = await http.get(Uri.parse(InfixApi.getPhotoAlbum()));
    Map<String, dynamic> map = json.decode(response.body);
    setState(() {
      ImageList = map["data"]["photo"];
      hasData = true;
    });
    print(ImageList);
    return "Success!";
  }
}
