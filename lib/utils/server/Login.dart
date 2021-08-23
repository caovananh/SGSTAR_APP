// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart' as DIO;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:infixedu/utils/FunctinsData.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/exception/DioException.dart';

class Login {
  final String email;
  final String password;

  Login(this.email, this.password);

  Future<bool> getData(BuildContext context) async {
    bool isSuccessed = false;
    dynamic id;
    dynamic rule;
    dynamic schoolId;
    String image;
    String isAdministrator;
    String zoom;
    String token;
    String full_name;

    Response response = await get(Uri.parse(InfixApi.login(email, password)));
    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> user = jsonDecode(response.body) as Map;
      isSuccessed = user['success'];
      id = user['data']['user']['id'];
      rule = user['data']['user']['role_id'];
      full_name = user['data']['user']['full_name'];
      schoolId = user['data']['user']['school_id'];
      isAdministrator = user['data']['user']['is_administrator'];
      token = user['data']['accessToken'];
      print(user['data']['device_token']);
      // print('Access token: $token');
      // print("RULE: $rule");

      // print("ZOOM: ${user['data']['system_settings']}");
      zoom = user['data']['system_settings'] == null
          ? '1'
          : user['data']['system_settings'][0]['Zoom']
              .toString(); // TODO:: CHANGE LATER WHEN API AVAILABLE

      if (rule == 1 || rule == 4) {
        image = user['data']['userDetails']['staff_photo'] == null ||
                user['data']['userDetails']['staff_photo'] == ''
            ? 'public/uploads/staff/demo/staff.jpg'
            : user['data']['userDetails']['staff_photo'];
      } else if (rule == 2) {
        image = user['data']['userDetails']['student_photo'] == null ||
                user['data']['userDetails']['student_photo'] == ''
            ? 'public/uploads/staff/demo/staff.jpg'
            : user['data']['userDetails']['student_photo'];
      } else if (rule == 3) {
        image = user['data']['userDetails']['guardian_photo'] == null ||
                user['data']['userDetails']['guardian_photo'] == ''
            ? 'public/uploads/staff/demo/staff.jpg'
            : user['data']['userDetails']['guardian_photo'];
      }

      // print("IMAMMMAMA : $image");
      if (isSuccessed) {
        saveBooleanValue('isLogged', isSuccessed);
        saveStringValue('email', email);
        saveStringValue('password', password);
        saveStringValue('id', '$id');
        saveStringValue('rule', '$rule');
        saveStringValue('schoolId', '$schoolId');
        saveStringValue('image', '$image');
        saveStringValue('isAdministrator', '$isAdministrator');
        saveStringValue('full_name', '$full_name');
        saveStringValue('lang', 'en');
        saveStringValue('token', token.toString());
        AppFunction.getFunctions(context, rule.toString(), zoom.toString());
      }
    }
    return isSuccessed;
  }

  Future<String> getData2(BuildContext context) async {
    bool isSuccessed = false;
    dynamic id;
    dynamic rule;
    dynamic schoolId;
    String image;
    String isAdministrator;
    String zoom;
    String token;
    String full_name;
    var message;
//    InfixApi api = InfixApi();

    bool isNullOrEmpty(Object o) => o == null || o == "";

    try {
      DIO.Dio dio = DIO.Dio();
      DIO.Response response =
          await dio.get(InfixApi.login(email, password)).catchError((e) {
        message = DioExceptions.fromDioError(e).toString();
        print('DIO ERROR: $message');
      });
      if (response.statusCode == 200) {
        print(response.data);
        var user = response.data;
        isSuccessed = user['success'];
        message = user['message'];
        id = user['data']['user']['id'];
        rule = user['data']['user']['role_id'];
        full_name = user['data']['user']['full_name'];
        schoolId = user['data']['user']['school_id'];
        isAdministrator = user['data']['user']['is_administrator'];
        token = user['data']['accessToken'];
        // print('Access token: $token');
        // print("ZOOM: ${user['data']['system_settings']}");
        zoom = user['data']['system_settings'] == null
            ? '1'
            : user['data']['system_settings'][0]['Zoom']
                .toString(); // TODO:: CHANGE LATER WHEN API AVAILABLE

        print("STUDENT PHOTO: ${user['data']['userDetails']}");

        if (rule == 1 || rule == 4) {
          image = isNullOrEmpty(user['data']['userDetails']['staff_photo'])
              ? 'public/uploads/staff/demo/staff.jpg'
              : user['data']['userDetails']['staff_photo'].toString();
        } else if (rule == 2) {
          image = isNullOrEmpty(user['data']['userDetails']['student_photo'])
              ? 'public/uploads/staff/demo/staff.jpg'
              : user['data']['userDetails']['student_photo'].toString();
        } else if (rule == 3) {
          image = isNullOrEmpty(user['data']['userDetails']['guardian_photo'])
              ? 'public/uploads/staff/demo/staff.jpg'
              : user['data']['userDetails']['guardian_photo'].toString();
        }
        if (isSuccessed) {
          saveBooleanValue('isLogged', isSuccessed);
          saveStringValue('email', email);
          saveStringValue('password', password);
          saveStringValue('id', '$id');
          saveStringValue('rule', '$rule');
          saveStringValue('full_name', '$full_name');
          saveStringValue('schoolId', '$schoolId');
          saveStringValue('image', '$image');
          saveStringValue('isAdministrator', '$isAdministrator');
          saveStringValue('lang', 'en');
          saveStringValue('token', token.toString());
          saveStringValue('zoom', zoom.toString());
          AppFunction.getFunctions(context, rule.toString(), zoom.toString());
        }
        return message;
      }
    } catch (e) {
      print(e);
      print(message);
    }
    return message;
  }

  Future<bool> saveBooleanValue(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(key, value);
  }

  Future<bool> saveStringValue(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(key, value);
  }
}
