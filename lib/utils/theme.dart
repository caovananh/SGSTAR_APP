// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
        headline5: base.headline5.copyWith(
          fontFamily: 'poppins',
          fontSize: ScreenUtil().setSp(16.0),
          fontWeight: FontWeight.w600,
          color: Color(0xFF415094),
        ),
        subtitle1: base.subtitle1.copyWith(
          fontFamily: 'poppins',
          fontSize: ScreenUtil().setSp(16.0),
          fontWeight: FontWeight.w500,
          color: Color(0xFF415094),
        ),subtitle2: base.subtitle1.copyWith(
          fontFamily: 'poppins',
          fontSize: ScreenUtil().setSp(14.0),
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
        headline6: base.headline6.copyWith(
          fontFamily: 'poppins',
          fontSize: ScreenUtil().setSp(14.0),
          fontWeight: FontWeight.w500,
          color: Color(0xFF415094),
        ),
        headline4: base.headline5.copyWith(
            fontFamily: 'poppins',
            fontSize: ScreenUtil().setSp(12.0),
            fontWeight: FontWeight.w300,
            color: Color(0xFF727FC8)),
        headline3: base.headline5.copyWith(
          fontFamily: 'poppins',
          fontSize: ScreenUtil().setSp(22.0),
          color: Colors.grey,
        ),
        caption: base.caption.copyWith(
          color: Color(0xFFCCC5AF),
        ),
        bodyText2: base.bodyText2.copyWith(color: Color(0xFF807A6B)));
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      //textTheme: Typography().white,
      primaryColor: Colors.indigo,
      //primaryColor: Color(0xff4829b2),
      indicatorColor: Color(0xFF807A6B),
      scaffoldBackgroundColor: Color(0xFFF5F5F5),
      accentColor: Colors.purpleAccent,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: ScreenUtil().setSp(30.0),
      ),
      buttonColor: Colors.white,
      backgroundColor: Colors.white,
      tabBarTheme: base.tabBarTheme.copyWith(
        labelColor: Color(0xffce107c),
        unselectedLabelColor: Colors.grey,
      ));
}
