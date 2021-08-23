// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:infixedu/utils/CustomAppBarWidget.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/model/Classes.dart';
import 'package:infixedu/utils/model/Section.dart';
import 'package:infixedu/utils/widget/ScaleRoute.dart';
import 'RoutineListScreen.dart';

class SearchRoutineScreen extends StatefulWidget {
  @override
  _SearchRoutineScreenState createState() => _SearchRoutineScreenState();
}

class _SearchRoutineScreenState extends State<SearchRoutineScreen> {
  String _id;
  int classId;
  int sectionId;
  String _selectedClass;
  String _selectedSection;
  Future<ClassList> classes;
  Future<SectionList> sections;
  String _token;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Utils.getStringValue('token').then((value) {
      setState(() {
        _token = value;
      });
      Utils.getStringValue('id').then((value) {
        setState(() {
          _id = value;
          classes = getAllClass(int.parse(_id));
          classes.then((value) {
            _selectedClass = value.classes[0].name;
            classId = value.classes[0].id;
            sections = getAllSection(int.parse(_id), classId);
            sections.then((sectionValue) {
              _selectedSection = sectionValue.sections[0].name;
              sectionId = sectionValue.sections[0].id;
            });
          });
        });
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
        appBar: CustomAppBarWidget(title: 'Search routine'),
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<ClassList>(
              future: classes,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: <Widget>[
                      getClassDropdown(snapshot.data.classes),
                      FutureBuilder<SectionList>(
                        future: sections,
                        builder: (context, secSnap) {
                          if (secSnap.hasData) {
                            return getSectionDropdown(secSnap.data.sections);
                          } else {
                            return Center(child: CupertinoActivityIndicator());
                          }
                        },
                      ),
                    ],
                  );
                } else {
                  return Center(child: CupertinoActivityIndicator());
                }
              },
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: Utils.gradientBtnDecoration,
              child: Text(
                "Search",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white, fontSize: ScreenUtil().setSp(16)),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
                context, ScaleRoute(page: StudentRoutine(classId, sectionId)));
          },
        ),
      ),
    );
  }

  Widget getClassDropdown(List<Classes> classes) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: DropdownButton(
        elevation: 0,
        isExpanded: true,
        items: classes.map((item) {
          return DropdownMenuItem<String>(
            value: item.name,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(item.name,style: Theme.of(context)
                  .textTheme
                  .headline4,),
            ),
          );
        }).toList(),
        style: Theme.of(context).textTheme.headline4.copyWith(fontSize: ScreenUtil().setSp(15)),
        onChanged: (value) {
          setState(() {
            _selectedClass = value;

            classId = getCode(classes, value);

            debugPrint('User select $classId');
          });
        },
        value: _selectedClass,
      ),
    );
  }

  Widget getSectionDropdown(List<Section> sectionlist) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: DropdownButton(
        elevation: 0,
        isExpanded: true,
        items: sectionlist.map((item) {
          return DropdownMenuItem<String>(
            value: item.name,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(item.name,style: Theme.of(context)
                  .textTheme
                  .headline4),
            ),
          );
        }).toList(),
        style: Theme.of(context).textTheme.headline4.copyWith(fontSize: ScreenUtil().setSp(15)),
        onChanged: (value) {
          setState(() {
            _selectedSection = value;

            sectionId = getCode(sectionlist, value);

            debugPrint('User select $sectionId');
          });
        },
        value: _selectedSection,
      ),
    );
  }

  int getCode<T>(T t, String title) {
    int code;
    for (var cls in t) {
      if (cls.name == title) {
        code = cls.id;
        break;
      }
    }
    return code;
  }

  Future<ClassList> getAllClass(int id) async {
    final response = await http.get(Uri.parse(InfixApi.getClassById(id)),headers: Utils.setHeader(_token.toString()));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return ClassList.fromJson(jsonData['data']['teacher_classes']);
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<SectionList> getAllSection(int id, int classId) async {
    final response = await http.get(Uri.parse(InfixApi.getSectionById(id, classId)),headers: Utils.setHeader(_token.toString()));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return SectionList.fromJson(jsonData['data']['teacher_sections']);
    } else {
      throw Exception('Failed to load');
    }
  }
}
