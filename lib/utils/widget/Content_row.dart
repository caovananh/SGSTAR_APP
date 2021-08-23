// Dart imports:
import 'dart:io';
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:file_utils/file_utils.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permissions_plugin/permissions_plugin.dart';

// Project imports:
import 'package:infixedu/screens/student/studyMaterials/StudyMaterialViewer.dart';
import 'package:infixedu/utils/FunctinsData.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/model/Content.dart';
import 'package:infixedu/utils/widget/ScaleRoute.dart';

// ignore: must_be_immutable
class ContentRow extends StatefulWidget {
  Content content;
  Animation animation;
  final VoidCallback onPressed;
  String token;
  int index;

  ContentRow(this.content, this.animation,
      {this.onPressed, this.token, this.index});

  @override
  _ContentRowState createState() => _ContentRowState(token);
}

class _ContentRowState extends State<ContentRow> {
  var progress = "Download";
  var received;
  var _token;

  _ContentRowState(this._token);

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: widget.animation,
      child: Container(
        child: InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, top: 20.0, right: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        widget.content.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          widget.content.description == null
                                              ? ''
                                              : widget.content.description,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4
                                              .copyWith(fontSize: ScreenUtil().setSp(12)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        widget.content.title == null
                            ? 'NA'
                            : widget.content.title,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: ScreenUtil().setSp(12)),
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          checkPermissions(context);
                          showDownloadAlertDialog(
                              context, widget.content.title);
                        },
                        child: Icon(
                          FontAwesomeIcons.download,
                          size: ScreenUtil().setSp(15),
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          showDeleteAlertDialog(context);
                        },
                        child: Icon(
                          FontAwesomeIcons.trash,
                          size: ScreenUtil().setSp(15),
                          color: Colors.redAccent,
                        ),
                        // child: Text(
                        //   'Delete',
                        //   textAlign: TextAlign.end,
                        //   style: Theme.of(context).textTheme.headline6.copyWith(
                        //       color: Colors.deepPurpleAccent,
                        //       decoration: TextDecoration.underline),
                        // ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Type',
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              widget.content.type == null
                                  ? 'not assigned'
                                  : widget.content.type,
                              // : AppFunction.getContentType(content.type),
                              maxLines: 1,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Date',
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              widget.content.uploadDate == null
                                  ? 'N/A'
                                  : widget.content.uploadDate,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Available for',
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              widget.content.availableFor == null
                                  ? 'N/A'
                                  : widget.content.availableFor,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 0.5,
                  margin: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.purple, Colors.deepPurple]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showDeleteAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget yesButton = TextButton(
      child: Text("Delete"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
        setState(() {
          deleteContent(widget.content.id);
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Delete",
        style: Theme.of(context).textTheme.headline5,
      ),
      content: Text("Would you like to delete the file?"),
      actions: [
        cancelButton,
        yesButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showDownloadAlertDialog(BuildContext context, title) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget yesButton = TextButton(
      child: Text("Download"),
      onPressed: () {
        widget.content.uploadFile != null
            ? downloadFile(widget.content.uploadFile, context, title)
            : Utils.showToast('no file found');
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Download",
        style: Theme.of(context).textTheme.headline5,
      ),
      content: Text("Would you like to download the file?"),
      actions: [
        cancelButton,
        yesButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> deleteContent(int cid) async {
    final response = await http.get(Uri.parse(InfixApi.deleteContent(cid)),
        headers: Utils.setHeader(_token));

    if (response.statusCode == 200) {
      widget.onPressed();
      Utils.showToast('Content deleted');
    } else {
      throw Exception('failed to load');
    }
  }

  Future<void> downloadFile(
      String url, BuildContext context, String title) async {
    print("URL: $url");
    Dio dio = Dio();

    String dirloc = "";
    if (Platform.isAndroid) {
      dirloc = "/sdcard/download/";
    } else {
      dirloc = (await getApplicationDocumentsDirectory()).path;
    }
    Utils.showToast(dirloc);

    try {
      FileUtils.mkdir([dirloc]);
      Utils.showToast("Downloading...");

      await dio.download(
          InfixApi.root + url, dirloc + AppFunction.getExtention(url),
          options: Options(headers: {HttpHeaders.acceptEncodingHeader: "*"}),
          onReceiveProgress: (receivedBytes, totalBytes) async {
        received = ((receivedBytes / totalBytes) * 100);
        setState(() {
          progress =
              ((receivedBytes / totalBytes) * 100).toStringAsFixed(0) + "%";
        });
        if (received == 100.0) {
          if (url.contains('.pdf')) {
            Utils.showToast(
                "Download Completed. File is also available in your download folder.");
            Navigator.push(
                context,
                ScaleRoute(
                    page: DownloadViewer(
                        title: title, filePath: InfixApi.root + url)));
          } else {
            var file =
                await DefaultCacheManager().getSingleFile(InfixApi.root + url);
            OpenFile.open(file.path);

            Utils.showToast(
                "Download Completed. File is also available in your download folder.");
          }
        }
      });
    } catch (e) {
      print(e);
    }
    // progress = "Download Completed.Go to the download folder to find the file";
  }

  Future<void> checkPermissions(BuildContext context) async {
    Map<Permission, PermissionState> permission =
        await PermissionsPlugin.checkPermissions([
      Permission.WRITE_EXTERNAL_STORAGE,
      Permission.READ_EXTERNAL_STORAGE,
    ]);

    if (permission[Permission.WRITE_EXTERNAL_STORAGE] !=
            PermissionState.GRANTED &&
        permission[Permission.READ_EXTERNAL_STORAGE] !=
            PermissionState.GRANTED) {
      try {
        permission = await PermissionsPlugin.requestPermissions([
          Permission.WRITE_EXTERNAL_STORAGE,
          Permission.READ_EXTERNAL_STORAGE,
        ]);
      } on Exception {
        debugPrint("Error");
      }

      if (permission[Permission.WRITE_EXTERNAL_STORAGE] ==
          PermissionState.GRANTED)
        print("write  permission ok");
      else
        permissionsDenied(context);
    } else {
      print("write permission ok");
    }

    if (permission[Permission.READ_EXTERNAL_STORAGE] == PermissionState.GRANTED)
      print("Read  permission ok");
    else
      permissionsDenied(context);
  }
}

void permissionsDenied(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext _context) {
        return SimpleDialog(
          title: const Text("Permission denied"),
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
              child: const Text(
                "You must grant all permission to use this application",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            )
          ],
        );
      });
}
