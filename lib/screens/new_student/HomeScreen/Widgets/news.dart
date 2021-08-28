import 'package:flutter/material.dart';

class News extends StatefulWidget {
  const News({key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    final items = List<String>.generate(5, (i) => "Item $i");
    double cardHeight = screenHeight * 0.415;
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: items.length,
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
                        child: Image.asset('assets/images/card-thumb.png'),
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
                            Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text('25/12/2021 14:30',
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
}
