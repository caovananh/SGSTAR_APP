import 'dart:convert';
import 'package:photo_view/photo_view.dart';
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

  List<dynamic> ImageList;
  List<dynamic> AlbumTitle;
  String title;
  bool hasData = false;
  String imgUrl;

  @override
  void initState() {
    name = getName();
    this.getPhotoAlbum();
    super.initState();
  }

  int countphoto;
  int _currentIndex = 0;

  //var imagesList = new List();
  List<String> imagesList = [];

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
    double imgHeight = screenHeight * 0.18;

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
                    Text(title != null ? title.toUpperCase() : ' ',
                        style: TextStyle(
                            color: Color(0xff13438f),
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                    Text(countphoto.toString(),
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
                  child: imgUrl != null
                      ? Image.network(imgUrl)
                      : Image.asset('assets/images/icons/no_image.png')),
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
                            imgUrl =
                                "https://sgstar.asia/public/uploads/category/" +
                                    "/" +
                                    ImageList[index]["path"];
                          });
                        },
                        viewportFraction: 0.7,
                        enlargeCenterPage: true,
                        autoPlay: false,
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
                                      Image.network(
                                          "https://sgstar.asia/public/uploads/category/" +
                                              "/" +
                                              e,
                                          fit: BoxFit.cover)
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
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
    // final response = await http.get(Uri.parse(InfixApi.getPhotoAlbum()));
    final response = await http.get(Uri.parse(InfixApi.getPhotoAlbum()));
    Map<String, dynamic> map = json.decode(response.body);
    setState(() {
      ImageList = map["data"]["photo"];
      AlbumTitle = map["data"]["title"];
      title = AlbumTitle[0]["title"];
      imgUrl = "https://sgstar.asia/public/uploads/category/" +
          "/" +
          ImageList[0]["path"];
      for (int i = 0; i < ImageList.length; i++) {
        imagesList.add(ImageList[i]["path"]);
      }
      countphoto = ImageList.length;
      hasData = true;
    });
    return "Success!";
  }
}
