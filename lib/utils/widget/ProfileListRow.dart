// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ProfileRowList extends StatelessWidget {
  String _key;
  String _value;

  ProfileRowList(this._key, this._value);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.white,
      // ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: _value != null
              ? _value.contains('+') &&
                          (_key.contains('Phone number') ||
                              _key.contains('Phone')) ||
                      _value.contains('@')
                  ? InkWell(
                      onTap: () async {
                        if (_value.contains('+')) {
                          await canLaunch('tel:$_value')
                              ? await launch('tel:$_value')
                              : throw 'Couldnt laucnh $_value';
                        } else if (_value.contains('@')) {
                          print(_value);
                          await canLaunch('mailto:$_value')
                              ? await launch('mailto:$_value')
                              : throw 'Couldnt laucnh $_value';
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _key,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(
                                        color: Color(0xff727fc8),
                                        fontWeight: FontWeight.normal,
                                        fontSize: ScreenUtil().setSp(12),
                                      ),
                                ),
                                SizedBox(
                                  height: 12.0.h,
                                ),
                                Container(
                                  height: 0.2.h,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF828BB2),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _value == null ? 'NA' : _value,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(
                                        color: Color(0xff727fc8),
                                        fontWeight: FontWeight.normal,
                                        fontSize: ScreenUtil().setSp(12),
                                      ),
                                ),
                                SizedBox(
                                  height: 12.0.h,
                                ),
                                Container(
                                  height: 0.2.h,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF828BB2),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _key,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(
                                      color: Color(0xff727fc8),
                                      fontWeight: FontWeight.normal,
                                      fontSize: ScreenUtil().setSp(12),
                                    ),
                              ),
                              SizedBox(
                                height: 12.0.h,
                              ),
                              Container(
                                height: 0.2.h,
                                decoration: BoxDecoration(
                                  color: Color(0xFF828BB2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _value == null ? 'NA' : _value,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(
                                      color: Color(0xff727fc8),
                                      fontWeight: FontWeight.normal,
                                      fontSize: ScreenUtil().setSp(12),
                                    ),
                              ),
                              SizedBox(
                                height: 12.0.h,
                              ),
                              Container(
                                height: 0.2.h,
                                decoration: BoxDecoration(
                                  color: Color(0xFF828BB2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
              : Container()),
    );
  }
}
