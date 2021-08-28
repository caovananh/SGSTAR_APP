import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/CardHeader.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:infixedu/screens/new_student/studentScreen/FeesAndPayment3.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class FeesAndPayment2 extends StatefulWidget {
  const FeesAndPayment2({Key key}) : super(key: key);

  @override
  _FeesAndPayment2State createState() => _FeesAndPayment2State();
}

class _FeesAndPayment2State extends State<FeesAndPayment2> {
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            CardHeader(
                child: Text(
              'TUITION FEES IN 2020-2021',
              style: TextStyle(color: Colors.white),
            )),
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                height: 250,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: null,
                scrollDirection: Axis.horizontal,
              ),
              items: [1, 2, 3, 4].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              // margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xFF7dd3f7)),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15),
                                  )),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFF7dd3f7),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                        )),
                                    width: double.infinity,
                                    height: 70,
                                    child: Center(
                                      child: Text(
                                        'Option $i',
                                        style: TextStyle(
                                            fontSize: 25.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Text('TERM 1',
                                            style: TextStyle(
                                                fontSize: 25.0,
                                                color: Color(0xff07509d),
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text('40.000.000 VNĐ',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Color(0xff07509d),
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                          Positioned(
                              top: 120,
                              right: -15,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 2, color: Color(0xFF7dd3f7)),
                                    borderRadius: BorderRadius.circular(15)),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    buttonCarouselController.nextPage();
                                  },
                                  icon: Icon(
                                    Icons.navigate_next,
                                    color: Colors.black,
                                  ),
                                  iconSize: 40,
                                ),
                              )),
                          Positioned(
                              top: 120,
                              left: -15,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 2, color: Color(0xFF7dd3f7)),
                                    borderRadius: BorderRadius.circular(15)),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    buttonCarouselController.previousPage();
                                  },
                                  icon: Icon(
                                    Icons.navigate_before,
                                    color: Colors.black,
                                  ),
                                  iconSize: 40,
                                ),
                              ))
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 150,
            ),
            Center(
              child: Text('Deadline: 25/12/2021',
                  style: TextStyle(color: Color(0xffe4087e), fontSize: 18)),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    pushNewScreen(
                      context,
                      screen: FeesAndPayment3(),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      'NEXT',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF7dd3f7)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      )))),
            ),
          ],
        ),
      ),
    );
  }
}
