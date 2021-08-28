import 'package:flutter/material.dart';

class CardHeader extends StatefulWidget {
  final Widget child;
  const CardHeader({Key key, @required this.child}) : super(key: key);

  @override
  _CardHeaderState createState() => _CardHeaderState();
}

class _CardHeaderState extends State<CardHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xFF7dd3f7),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ]),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15),
          child: DefaultTextStyle(
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff07509d)),
              child: widget.child),
        )),
      ),
    );
  }
}
