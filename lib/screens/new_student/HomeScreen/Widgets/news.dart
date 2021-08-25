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
                      height: screenHeight / 6,
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
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                      children: [
                                        IconButton(
                                            icon: Image.asset(
                                              'assets/images/icons/4. LIKE.png',
                                            ),
                                            color: Colors.grey,
                                            tooltip: 'Like',
                                            onPressed: () {}),
                                        Text('0 like'),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                      children: [
                                        IconButton(
                                            icon: Icon(Icons.comment),
                                            color: Colors.grey,
                                            tooltip: 'comment',
                                            onPressed: () {}),
                                        Text('0 comment'),
                                      ],
                                    ),
                                  ),
                                ),
                                IconButton(
                                    icon: Icon(Icons.share),
                                    color: Colors.grey,
                                    tooltip: 'Comments',
                                    onPressed: () {}),
                                Text('0 share'),
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
