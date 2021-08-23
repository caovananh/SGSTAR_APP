import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({key}) : super(key: key);
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {

  String name;

  void initState() {
    super.initState();
    name = getName();
  }

  final List<String> imageList = [
    "https://sgstar.edu.vn/public/images/pic4.png",
    "https://sgstar.edu.vn/public/images/pic4.png",
    "https://sgstar.edu.vn/public/images/pic4.png",
    "https://sgstar.edu.vn/public/images/pic4.png",
    "https://sgstar.edu.vn/public/images/pic4.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
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
                    
                    bottom: BorderSide( //                    <--- top side
                      color: Color(0xff7cd3f7),
                      width: 2.0,
                    ),
                  ),
                  
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('album name'.toUpperCase(),
                      style: TextStyle(color: Color(0xff13438f),fontSize: 18,fontWeight: FontWeight.w700)),
                      Text('1',style: TextStyle(color: Color(0xff13438f),fontSize: 18,fontWeight: FontWeight.w700))
                    ],
                ),
              ),
            ),
 
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset('assets/images/pic4.png')
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Center(
                child: CarouselSlider(
                    options: CarouselOptions(
                      enableInfiniteScroll: true,
                      height: 140,
                    
                      viewportFraction: 0.7,
                      enlargeCenterPage: false,
                      autoPlay: false,
                    ),
                    items: imageList.map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(e,
                              
                              fit: BoxFit.cover)
                            ],
                        ),
                        
                      ),
                    )).toList(),
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
}
