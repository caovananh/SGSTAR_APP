// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:infixedu/utils/CustomAppBarWidget.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/model/Content.dart';
import 'package:infixedu/utils/widget/Content_row.dart';

class ContentListScreen extends StatefulWidget {
  @override
  _ContentListScreenState createState() => _ContentListScreenState();
}

class _ContentListScreenState extends State<ContentListScreen> {
  Future<ContentList> contents;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  String _token;

  @override
  void initState() {
    super.initState();
    Utils.getStringValue('token').then((value) {
      setState(() {
        _token = value;
        contents = fetchContent();
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
          title: 'Contents',
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder<ContentList>(
          future: contents,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot != null) {
              return AnimatedList(
                key: _listKey,
                initialItemCount: snapshot.data.contents.length,
                itemBuilder: (context, index, animation) {
                  return ContentRow(
                    snapshot.data.contents[index],
                    animation,
                    onPressed: () async{
//                     snapshot.data.contents.removeAt(index);
                      Utils.showToast('${snapshot.data.contents[index].title} deleted');
                      _removeItem(index, snapshot.data.contents);
                    },
                    token: _token,
                  );
                },
              );
            } else {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  void _removeItem(int index,List<Content> cList) {
    int removeIndex = index;
    Content removeItem = cList.removeAt(removeIndex);
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return ContentRow(removeItem, animation,index: index);
    };
    _listKey.currentState.removeItem(removeIndex, builder);
  }

  Future<ContentList> fetchContent() async {
    final response = await http.get(Uri.parse(InfixApi.getAllContent()),
        headers: Utils.setHeader(_token));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData);

      return ContentList.fromJson(jsonData['data']['uploadContents']);
    } else {
      throw Exception('failed to load');
    }
  }
}
