// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:infixedu/utils/CustomAppBarWidget.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/model/AdminFees.dart';
import 'package:infixedu/utils/widget/Admin_Fees_List_Row.dart';

class AdminFeeListView extends StatefulWidget {
  @override
  _AdminFeeListViewState createState() => _AdminFeeListViewState();
}

class _AdminFeeListViewState extends State<AdminFeeListView> {
  Future<AdminFeesList> fees;

  String _token;

  @override
  void initState() {
    super.initState();
    Utils.getStringValue('token').then((value) {
      setState(() {
        _token = value;
        fees = getAllFee();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.indigo, //or set color with: Color(0xFF0000FF)
    ));

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
          appBar: CustomAppBarWidget(
            title: 'Fees Type',
          ),
          backgroundColor: Colors.white,
          body: FutureBuilder<AdminFeesList>(
            future: fees,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.adminFees.length,
                  itemBuilder: (context, index) {
                    return AdminFeesListRow(snapshot.data.adminFees[index]);
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }

  Future<AdminFeesList> getAllFee() async {
    final response = await http.get(Uri.parse(InfixApi.adminFeeList),headers: Utils.setHeader(_token.toString()));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      return AdminFeesList.fromjson(jsonData['data']);
    } else {
      throw Exception('Failed to load');
    }
  }
}
