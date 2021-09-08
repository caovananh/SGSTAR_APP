import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BusDropDown extends StatefulWidget {
  final Widget title;
  final Widget content;
  const BusDropDown({Key key, @required this.title, @required this.content})
      : super(key: key);

  @override
  _BusDropDownState createState() => _BusDropDownState();
}

class _BusDropDownState extends State<BusDropDown> {
  bool _isOpen = false;
  var customIcon = FontAwesomeIcons.angleDown;
  bool _runing = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          SizedBox(
            height: 60,
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
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 2, color: const Color(0xff07509d)),
                        color: Color(0xff07509d),
                      ),
                      width: MediaQuery.of(context).size.width - 40,
                      height: 50,
                      child: DefaultTextStyle(
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff)
                                 ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                widget.title,
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
                Positioned(
                    top: 15,
                    right: 10,
                    child: Icon(
                      customIcon,
                      size: ScreenUtil().setSp(26),
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Visibility(
            child: Container(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border:
                    Border.all(width: 2.0, color: const Color(0xFF7dd3f7))),
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
          customIcon = FontAwesomeIcons.angleUp;
          _isOpen = true;
          _runing = false;
        });
      } else {
        setState(() {
          customIcon = FontAwesomeIcons.angleDown;
          _isOpen = false;
          _runing = false;
        });
      }
    }
  }
}
