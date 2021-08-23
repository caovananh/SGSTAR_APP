import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SchoolLife extends StatefulWidget {
  @override
  State<SchoolLife> createState() => SchoolLifeState();
}

class SchoolLifeState extends State<SchoolLife> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "What is Lorem Ipsum",
                    style: TextStyle(
                      color: Color(0xFF144385),
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "There are many variations of passages of Lorem Ipsum available, but the majority have"
                    " suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If"
                    " you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden i"
                    "n the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks"
                    " as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, "
                    "combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. "
                    "The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      "There are many variations of passages of Lorem Ipsum available, but the majority have"
                      " suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If"
                      " you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden i"
                      "n the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks"
                      " as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, "
                      "combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. "
                      "The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."),
                ),
              ],
              addAutomaticKeepAlives: false,
            ),
          ),
        ],
      ),
    );
  }
}
