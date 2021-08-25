import 'package:flutter/material.dart';

class Curriculum extends StatefulWidget {
  const Curriculum({key}) : super(key: key);

  @override
  _CurriculumState createState() => _CurriculumState();
}

class _CurriculumState extends State<Curriculum> {
  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return Container(
      color: Colors.white,
      child: GridView.count(
        primary: true,
        padding: const EdgeInsets.all(50),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: shortestSide < 600 ? 2 : 3,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(0),
              child:
                  Image(image: AssetImage('assets/images/icons/resilent.png'))),
          Container(
            padding: const EdgeInsets.all(0),
            child: Image(image: AssetImage('assets/images/icons/empath.png')),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            child: Image(image: AssetImage('assets/images/icons/ethical.png')),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            child:
                Image(image: AssetImage('assets/images/icons/respectful.png')),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            child: Image(image: AssetImage('assets/images/icons/communi.png')),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            child: Image(image: AssetImage('assets/images/icons/collab.png')),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            child: Image(image: AssetImage('assets/images/icons/thinker.png')),
          ),
        ],
      ),
    );
  }
}
