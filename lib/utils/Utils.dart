// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Package imports:
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static Future<bool> saveBooleanValue(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(key, value);
  }

  static Future<bool> saveStringValue(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(key, value);
  }

  static Future<bool> saveIntValue(String key, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setInt(key, value);
  }

  static Future<bool> getBooleanValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static Future<String> getStringValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(prefs.getString(key));
    return prefs.getString(key);
  }

  static Future<int> getIntValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    return prefs.getInt(key);
  }

  static Future<bool> clearAllValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static Future<String> getTranslatedLanguage(
      String languageCode, String key) async {
    Map<dynamic, dynamic> _localisedValues;
    String jsonContent = await rootBundle
        .loadString("assets/locale/localization_$languageCode.json");
    _localisedValues = json.decode(jsonContent);
    return _localisedValues[key] ?? "$key";
  }

  static setHeader(String token) {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
    };
    return header;
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        textColor: Colors.white,
        backgroundColor: Colors.purple,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1);
  }

  static BoxDecoration gradientBtnDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      gradient: LinearGradient(
        colors: [
          Color(0xff7C32FF),
          Color(0xffC738D8),
        ],
      ));

  static Text checkTextValue(text, value) {
    return Text(
      "$text:: " + value.toString(),
      style: TextStyle(fontSize: 18),
    );
  }

  static Widget noDataWidget() {
    return Center(
        child: Text('No data available.',
            style: TextStyle(
              fontFamily: 'poppins',
              fontSize: ScreenUtil().setSp(16.0),
              fontWeight: FontWeight.bold,
              color: Color(0xFF415094),
            )));
  }
}
