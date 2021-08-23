// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:infixedu/utils/CustomAppBarWidget.dart';
// import 'package:infixedu/utils/pdf_flutter.dart';
import 'package:pdf_flutter/pdf_flutter.dart';

class DownloadViewer extends StatefulWidget {
  final String title;
  final String filePath;
  DownloadViewer({this.title, this.filePath});
  @override
  _DownloadViewerState createState() => _DownloadViewerState();
}

class _DownloadViewerState extends State<DownloadViewer> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.indigo, //or set color with: Color(0xFF0000FF)
    ));

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
        appBar: CustomAppBarWidget(title: widget.title),
        body: PDF.network(
          widget.filePath,
        ),
      ),
    );
  }
}
