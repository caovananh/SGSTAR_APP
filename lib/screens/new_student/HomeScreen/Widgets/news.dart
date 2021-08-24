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
    final double screenWidth = MediaQuery.of(context).size.width;
    double cardHeight = (screenWidth / screenHeight)*650;
   
    return ListView(
      children: [
        Container(
          height: cardHeight,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Card(
            semanticContainer: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage("assets/images/card-thumb.png"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text("25/12/2021     14:30",
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.end),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: Image.asset(
                            'assets/images/icons/4. LIKE.png',
                            height: 25,
                            width: 30,
                          ),
                          color: Colors.grey,
                          tooltip: 'Like',
                          onPressed: () {}),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text('0 like'),
                      ),
                      IconButton(
                          icon: Icon(Icons.comment),
                          color: Colors.grey,
                          tooltip: 'Comments',
                          onPressed: () {}),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text('0 comment'),
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
        Container(
          height: cardHeight,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Card(
            semanticContainer: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage("assets/images/card-thumb.png"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text("25/12/2021     14:30",
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.end),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: Image.asset(
                            'assets/images/icons/4. LIKE.png',
                            height: 25,
                            width: 30,
                          ),
                          color: Colors.grey,
                          tooltip: 'Like',
                          onPressed: () {}),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text('0 like'),
                      ),
                      IconButton(
                          icon: Icon(Icons.comment),
                          color: Colors.grey,
                          tooltip: 'Comments',
                          onPressed: () {}),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text('0 comment'),
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
    );
  }
}
