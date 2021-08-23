// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:infixedu/utils/CustomAppBarWidget.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/model/InfixMap.dart';
import 'package:infixedu/utils/server/About.dart';
import 'package:infixedu/utils/widget/ProfileListRow.dart';

// ignore: must_be_immutable
class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  About about = About();

  String _token;

  @override
  void initState() {
    Utils.getStringValue('token').then((value) {
      setState(() {
        _token = value;
      });
    });
    super.initState();
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
          title: 'About',
        ),
        backgroundColor: Colors.white,
        body: getAboutList(context),
      ),
    );
  }

  Widget getAboutList(BuildContext context) {
    return FutureBuilder<List<InfixMap>>(
      future: about.fetchAboutServices(_token),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${snapshot.data[0].value}',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: ScreenUtil().setSp(15), color: Colors.deepPurple),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.length - 1,
                    itemBuilder: (context, index) {
                      return ProfileRowList(snapshot.data[index + 1].key,
                          snapshot.data[index + 1].value);
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }
      },
    );
  }
}
