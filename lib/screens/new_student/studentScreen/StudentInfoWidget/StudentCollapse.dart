import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StudentCollapse extends StatefulWidget {
  final Widget title;
  final Widget content;

  const StudentCollapse({Key key, @required this.title, @required this.content})
      : super(key: key);

  @override
  _StudentCollapse createState() => _StudentCollapse();
}

class _StudentCollapse extends State<StudentCollapse> {
  bool _isOpen = false;

  bool _runing = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width - 40,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 5,
                  child: InkWell(
                    onTap: () {
                      collapse();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            width: 2, color: const Color(0xFF7dd3f7)),
                        color: _isOpen == true
                            ? Color(0xFF7dd3f7)
                            : Color(0xFFffffff),
                      ),
                      width: MediaQuery.of(context).size.width - 40,
                      height: 40,
                      child: DefaultTextStyle(
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: _isOpen == true
                                  ? Color(0xffffffff)
                                  : Color(0xff07509d)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              widget.title,
                            ],
                          )),
                    ),
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 10,
                    child: Icon(
                      FontAwesomeIcons.angleUp,
                      size: ScreenUtil().setSp(25),
                      color: Color(0xff07509d),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Visibility(
            child: Container(
                padding: const EdgeInsets.only(
                    left: 30, top: 20, right: 30, bottom: 40),
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15.0,
                  ),
                  border: Border(
                    top: BorderSide(width: 2.0, color: const Color(0xFF7dd3f7)),
                    left:
                        BorderSide(width: 2.0, color: const Color(0xFF7dd3f7)),
                    right:
                        BorderSide(width: 2.0, color: const Color(0xFF7dd3f7)),
                    bottom:
                        BorderSide(width: 2.0, color: const Color(0xFF7dd3f7)),
                  ),
                ),
                child: widget.content),
            visible: _isOpen == true ? true : false,
          ),
        ],
      ),
    );
  }

  void collapse() {
    if (_runing == true) {
      return null;
    } else {
      _runing = true;
      if (_isOpen == false) {
        setState(() {
          _isOpen = true;
          _runing = false;
        });
      } else {
        setState(() {
          _isOpen = false;
          _runing = false;
        });
      }
    }
  }
}
