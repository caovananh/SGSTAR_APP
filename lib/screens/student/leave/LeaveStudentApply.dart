// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:permissions_plugin/permissions_plugin.dart';

// Project imports:
import 'package:infixedu/utils/CustomAppBarWidget.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/exception/DioException.dart';
import 'package:infixedu/utils/model/LeaveType.dart';

// ignore: must_be_immutable
class LeaveStudentApply extends StatefulWidget {
  String id;

  LeaveStudentApply(this.id);

  @override
  _LeaveStudentApplyState createState() => _LeaveStudentApplyState();
}

class _LeaveStudentApplyState extends State<LeaveStudentApply> {
  var _id;
  String applyDate;
  String fromDate;
  String toDate;
  String leaveType;
  int leaveId;
  TextEditingController reasonController = TextEditingController();
  DateTime date;
  String maxDateTime = '2031-11-25';
  String initDateTime = '2019-05-17';
  String _format = 'yyyy-MMMM-dd';
  DateTime _dateTime;
  DateTimePickerLocale _locale = DateTimePickerLocale.en_us;
  File _file;
  bool isResponse = false;
  Response response;
  Dio dio = new Dio();
  Future<LeaveList> leaves;
  bool leaveAvailable = false;

  String _token;

  @override
  void initState() {
    super.initState();
    Utils.getStringValue('token').then((value) {
      setState(() {
        _token = value;
        Utils.getStringValue('id').then((value) {
          setState(() {
            _id = widget.id != null ? int.parse(widget.id) : int.parse(value);
            date = DateTime.now();
            initDateTime =
                '${date.year}-${getAbsoluteDate(date.month)}-${getAbsoluteDate(date.day)}';
            _dateTime = DateTime.parse(initDateTime);
            leaves = getAllLeaveType(_id);
            leaves.then((value) {
              setState(() {
                if (value.types.length > 0) {
                  leaveAvailable = true;
                  leaveId = value.types.length != 0 ? value.types[0].id : 0;
                  leaveType =
                      value.types.length != 0 ? value.types[0].type : '';
                }
              });
            });
          });
        });
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    checkPermissions(context);
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
        appBar: CustomAppBarWidget(title: 'Apply Leave'),
        backgroundColor: Colors.white,
        body: Container(
          child: getContent(context),
        ),
      ),
    );
  }

  Widget getContent(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: FutureBuilder<LeaveList>(
            future: leaves,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: <Widget>[
                    leaveAvailable
                        ? getLeaveTypeDropdown(snapshot.data.types)
                        : Container(),
                    InkWell(
                      onTap: () {
                        DatePicker.showDatePicker(
                          context,
                          pickerTheme: DateTimePickerTheme(
                            confirm: Text('Done',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: ScreenUtil().setSp(14))),
                            cancel: Text('cancel',
                                style: TextStyle(
                                    color: Colors.cyan,
                                    fontSize: ScreenUtil().setSp(14))),
                          ),
                          minDateTime: DateTime.parse(initDateTime),
                          maxDateTime: DateTime.parse(maxDateTime),
                          initialDateTime: _dateTime,
                          dateFormat: _format,
                          locale: _locale,
                          onClose: () => print("----- onClose -----"),
                          onCancel: () => print('onCancel'),
                          onChange: (dateTime, List<int> index) {
                            setState(() {
                              _dateTime = dateTime;
                            });
                          },
                          onConfirm: (dateTime, List<int> index) {
                            setState(() {
                              setState(() {
                                _dateTime = dateTime;
                                print(
                                    '${_dateTime.year}-0${_dateTime.month}-${_dateTime.day}');
                                applyDate =
                                    '${_dateTime.year}-${getAbsoluteDate(_dateTime.month)}-${getAbsoluteDate(_dateTime.day)}';
                              });
                            });
                          },
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 8.0),
                                child: Text(
                                  applyDate == null ? 'Apply Date' : applyDate,
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.calendar_today,
                              color: Colors.black12,
                              size: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        DatePicker.showDatePicker(
                          context,
                          pickerTheme: DateTimePickerTheme(
                            confirm: Text('Done',
                                style: TextStyle(color: Colors.red)),
                            cancel: Text('cancel',
                                style: TextStyle(color: Colors.cyan)),
                          ),
                          minDateTime: DateTime.parse(initDateTime),
                          maxDateTime: DateTime.parse(maxDateTime),
                          initialDateTime: _dateTime,
                          dateFormat: _format,
                          locale: _locale,
                          onClose: () => print("----- onClose -----"),
                          onCancel: () => print('onCancel'),
                          onChange: (dateTime, List<int> index) {
                            setState(() {
                              _dateTime = dateTime;
                            });
                          },
                          onConfirm: (dateTime, List<int> index) {
                            setState(() {
                              setState(() {
                                _dateTime = dateTime;
                                print(
                                    '${_dateTime.year}-0${_dateTime.month}-${_dateTime.day}');
                                fromDate =
                                    '${_dateTime.year}-${getAbsoluteDate(_dateTime.month)}-${getAbsoluteDate(_dateTime.day)}';
                              });
                            });
                          },
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 8.0),
                                child: Text(
                                  fromDate == null ? 'From Date' : fromDate,
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.calendar_today,
                              color: Colors.black12,
                              size: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        DatePicker.showDatePicker(
                          context,
                          pickerTheme: DateTimePickerTheme(
                            confirm: Text('Done',
                                style: TextStyle(color: Colors.red)),
                            cancel: Text('cancel',
                                style: TextStyle(color: Colors.cyan)),
                          ),
                          minDateTime: DateTime.parse(initDateTime),
                          maxDateTime: DateTime.parse(maxDateTime),
                          initialDateTime: _dateTime,
                          dateFormat: _format,
                          locale: _locale,
                          onClose: () => print("----- onClose -----"),
                          onCancel: () => print('onCancel'),
                          onChange: (dateTime, List<int> index) {
                            setState(() {
                              _dateTime = dateTime;
                            });
                          },
                          onConfirm: (dateTime, List<int> index) {
                            setState(() {
                              setState(() {
                                _dateTime = dateTime;
                                print(
                                    '${_dateTime.year}-0${_dateTime.month}-${_dateTime.day}');
                                toDate =
                                    '${_dateTime.year}-${getAbsoluteDate(_dateTime.month)}-${getAbsoluteDate(_dateTime.day)}';
                              });
                            });
                          },
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 8.0),
                                child: Text(
                                  toDate == null ? 'To Date' : toDate,
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.calendar_today,
                              color: Colors.black12,
                              size: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        pickDocument();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  _file == null
                                      ? 'Select file'
                                      : _file.path.split('/').last,
                                  style: Theme.of(context).textTheme.headline4,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            Text('Browse',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                        decoration: TextDecoration.underline)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        style: Theme.of(context).textTheme.headline4,
                        controller: reasonController,
                        decoration: InputDecoration(
                            hintText: "Reason",
                            labelText: "Reason",
                            labelStyle: Theme.of(context).textTheme.headline4,
                            errorStyle: TextStyle(
                                color: Colors.pinkAccent, fontSize: 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: CupertinoActivityIndicator());
              }
            },
          ),
        ),
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: Utils.gradientBtnDecoration,
              child: Text(
                "Apply",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ),
          onTap: () {
            String reason = reasonController.text;

            if (reason.isNotEmpty && _file.path.isNotEmpty) {
              setState(() {
                isResponse = true;
              });
              uploadLeave();
            } else {
              Utils.showToast('Check all the field');
            }
          },
        ),
        isResponse == true
            ? LinearProgressIndicator(
                backgroundColor: Colors.transparent,
              )
            : Text(''),
      ],
    );
  }

  Widget getLeaveTypeDropdown(List<LeaveType> leaves) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: DropdownButton(
        elevation: 0,
        isExpanded: true,
        items: leaves.map((item) {
          return DropdownMenuItem<String>(
            value: item.type,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                item.type,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          );
        }).toList(),
        style: Theme.of(context)
            .textTheme
            .headline4
            .copyWith(fontSize: ScreenUtil().setSp(14)),
        onChanged: (value) {
          setState(() {
            leaveType = value;
            leaveId = getLeaveId(leaves, value);
            debugPrint('User select $leaveId');
          });
        },
        value: leaveType,
      ),
    );
  }

  int getLeaveId<T>(T t, String type) {
    int code;
    for (var s in t) {
      if (s.type == type) {
        code = s.id;
      }
    }
    return code;
  }

  Future<LeaveList> getAllLeaveType(id) async {
    final response = await http.get(Uri.parse(InfixApi.userLeaveType(id)),
        headers: Utils.setHeader(_token.toString()));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return LeaveList.fromJson(jsonData['data']);
    } else {
      throw Exception('Failed to load');
    }
  }

  void uploadLeave() async {
    FormData formData = FormData.fromMap({
      "apply_date": '$applyDate',
      "leave_from": '$fromDate',
      "leave_to": toDate,
      "login_id": _id,
      "leave_type": '$leaveId',
      "reason": reasonController.text,
      "attach_file": await MultipartFile.fromFile(_file.path),
    });
    response = await dio.post(
      InfixApi.userApplyLeaveStore,
      data: formData,
      options: Options(
        headers: {
          "Accept": "application/json",
          "Authorization": _token.toString(),
        },
      ),
      onSendProgress: (received, total) {
        if (total != -1) {
          // progress = (received / total * 100).toDouble();
          print((received / total * 100).toStringAsFixed(0) + '%');
        }
      },
    ).catchError((e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      print(errorMessage);
      Utils.showToast(errorMessage);
      Navigator.of(context).pop();
    });

    if (response.statusCode == 200) {
      Utils.showToast(
          'Leave Request has been created successfully. Please wait for approval');
      Navigator.pop(context);
    } else {
      Utils.showToast(response.statusCode.toString());
    }
  }

  String getAbsoluteDate(int date) {
    return date < 10 ? '0$date' : '$date';
  }

  Future pickDocument() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _file = File(result.files.single.path);
      });
    } else {
      Utils.showToast('Cancelled');
    }
  }

  Future<void> checkPermissions(BuildContext context) async {
    Map<Permission, PermissionState> permission =
        await PermissionsPlugin.checkPermissions([
      Permission.READ_EXTERNAL_STORAGE,
    ]);

    if (permission[Permission.READ_EXTERNAL_STORAGE] !=
        PermissionState.GRANTED) {
      try {
        permission = await PermissionsPlugin.requestPermissions([
          Permission.READ_EXTERNAL_STORAGE,
        ]);
      } on Exception {
        debugPrint("Error");
      }

      if (permission[Permission.READ_EXTERNAL_STORAGE] ==
          PermissionState.GRANTED)
        print(" permission ok");
      else
        permissionsDenied(context);
    } else {
      print("permission ok");
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
}
