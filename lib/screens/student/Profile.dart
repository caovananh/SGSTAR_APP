// Dart imports:
import 'dart:async';
import 'dart:convert';
// import 'dart:developer';
import 'dart:io';

// Flutter imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:file_utils/file_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permissions_plugin/permissions_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:infixedu/screens/student/studyMaterials/StudyMaterialViewer.dart';
import 'package:infixedu/utils/CustomAppBarWidget.dart';
import 'package:infixedu/utils/FunctinsData.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/model/InfixMap.dart';
import 'package:infixedu/utils/model/UserDetails.dart';
import 'package:infixedu/utils/server/ProfileService.dart';
import 'package:infixedu/utils/widget/ProfileListRow.dart';
import 'package:infixedu/utils/widget/ScaleRoute.dart';
import 'package:infixedu/utils/widget/ShimmerListWidget.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  String id;
  String image;

  Profile({this.id, this.image});

  @override
  _ProfileState createState() => _ProfileState(id: id, image: image);
}

class _ProfileState extends State<Profile> {
  bool isPersonal = false;
  bool isParents = false;
  bool isTransport = false;
  bool isOthers = false;
  String section = 'personal';
  String _email;
  String _password;
  String id;
  String image;
  String schoolId;
  String _token;
  ProfileService profileService;
  UserDetails userDetails;
  var progress = "";
  var received;

  _ProfileState({this.id, this.image});

  static List<Tab> tabs = <Tab>[
    Tab(
      text: 'Personal'.toUpperCase(),
    ),
    Tab(
      text: 'Parents'.toUpperCase(),
    ),
    Tab(
      text: 'Transport'.toUpperCase(),
    ),
    Tab(
      text: 'Others'.toUpperCase(),
    ),
  ];

  @override
  void initState() {
    Utils.getStringValue('token').then((value) {
      _token = value;
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Utils.getStringValue('email').then((value) {
      setState(() {
        _email = value;
      });
    });
    Utils.getStringValue('schoolId').then((value) {
      setState(() {
        schoolId = value;
      });
    });
    super.didChangeDependencies();
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
        appBar: CustomAppBarWidget(title: 'Profile'),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding:
                  EdgeInsets.only(left: 18, top: 40, right: 18, bottom: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  FutureBuilder(
                    future: Utils.getStringValue('image'),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: ScreenUtil().setSp(25),
                            child: CachedNetworkImage(
                              imageUrl: image == null
                                  ? InfixApi.root + snapshot.data
                                  : image,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  CupertinoActivityIndicator(),
                              errorWidget: (context, url, error) =>
                                  CachedNetworkImage(
                                imageUrl: InfixApi.root +
                                    'public/uploads/staff/demo/staff.jpg',
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CupertinoActivityIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                        );
                        // return Align(
                        //   child: CircleAvatar(
                        //     radius: ScreenUtil().setSp(25.0),
                        //     backgroundImage: NetworkImage(image == null
                        //         ? InfixApi.root + snapshot.data
                        //         : image),
                        //     backgroundColor: Colors.transparent,
                        //   ),
                        // );
                      } else {
                        return Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            radius: 25.0,
                            backgroundImage: NetworkImage(
                                'http://saskolhmg.com/images/studentprofile.png'),
                            backgroundColor: Colors.transparent,
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(child: getProfileHeader()),
                ],
              ),
            ),
            Expanded(
              child: PreferredSize(
                preferredSize: Size.fromHeight(10),
                child: DefaultTabController(
                  length: tabs.length,
                  initialIndex: 0,
                  child: Builder(
                    builder: (context) {
                      final TabController tabController =
                          DefaultTabController.of(context);
                      tabController.addListener(() {
                        if (tabController.indexIsChanging) {
                          print(tabController.index);
                        }
                      });
                      return Scaffold(
                        backgroundColor: Colors.white,
                        appBar: AppBar(
                          automaticallyImplyLeading: false,
                          backgroundColor: Colors.white,
                          // shadowColor: Colors.purple,
                          elevation: 0,
                          title: TabBar(
                            labelColor: Color(0xff415094),
                            labelPadding: EdgeInsets.all(5),
                            indicatorColor: Colors.purple,
                            indicatorWeight: 3,
                            tabs: tabs,
                            labelStyle: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    color: Color(0xff415094),
                                    fontSize: ScreenUtil().setSp(11),
                                    fontWeight: FontWeight.bold),
                            unselectedLabelStyle: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    color: Color(0xff415094),
                                    fontSize: ScreenUtil().setSp(11),
                                    fontWeight: FontWeight.bold),
                            unselectedLabelColor: Color(0xff415094),
                          ),
                        ),
                        body: Column(
                          children: [
                            Container(
                              height: 15.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffe8d6fd).withOpacity(0.5),
                                      Colors.white
                                    ]),
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  getProfileList(0),
                                  getParentDetails(),
                                  getProfileList(2),
                                  getOtherDetails(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getOtherDetails() {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: FutureBuilder(
        future: Utils.getStringValue('password'),
        builder: (context, snapshot) {
          _password = snapshot.data;

          profileService = id == null
              ? ProfileService(
                  email: _email, password: _password, schoolId: schoolId)
              : ProfileService(id: id, token: _token);

          return FutureBuilder<UserDetails>(
            future: fetchParentDetails(),
            builder:
                (BuildContext context, AsyncSnapshot<UserDetails> snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        snapshot.data.height == null ||
                                snapshot.data.height == ""
                            ? Container()
                            : ProfileDetailsRow(
                                title: "Height",
                                value: snapshot.data.height,
                              ),
                        snapshot.data.weight == null ||
                                snapshot.data.weight == ""
                            ? Container()
                            : ProfileDetailsRow(
                                title: "Weight",
                                value: snapshot.data.weight,
                              ),
                        snapshot.data.nationalIdNo == null ||
                                snapshot.data.nationalIdNo == ""
                            ? Container()
                            : ProfileDetailsRow(
                                title: "National ID Number",
                                value: snapshot.data.nationalIdNo,
                              ),
                        snapshot.data.localIdNo == null ||
                                snapshot.data.localIdNo == ""
                            ? Container()
                            : ProfileDetailsRow(
                                title: "Local ID Number",
                                value: snapshot.data.localIdNo,
                              ),
                        snapshot.data.bankName == null ||
                                snapshot.data.bankName == ""
                            ? Container()
                            : ProfileDetailsRow(
                                title: "Bank Name",
                                value: snapshot.data.bankName,
                              ),
                        snapshot.data.bankAccountNo == null ||
                                snapshot.data.bankAccountNo == ""
                            ? Container()
                            : ProfileDetailsRow(
                                title: "Bank Account Number",
                                value: snapshot.data.bankAccountNo,
                              ),
                        SizedBox(
                          height: 5,
                        ),
                        isNullOrEmpty(snapshot.data.documentFile1) ||
                                isNullOrEmpty(snapshot.data.documentFile2) ||
                                isNullOrEmpty(snapshot.data.documentFile3) ||
                                isNullOrEmpty(snapshot.data.documentFile4)
                            ? Container()
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: Text(
                                  "Documents",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(
                                        color: Color(0xff727fc8),
                                        fontWeight: FontWeight.normal,
                                        fontSize: ScreenUtil().setSp(12),
                                      ),
                                ),
                              ),
                        snapshot.data.documentFile1 == null ||
                                snapshot.data.documentFile1 == ""
                            ? Container()
                            : ListTile(
                                onTap: () {
                                  showDownloadAlertDialog(
                                    context,
                                    snapshot.data.documentTitle1,
                                    snapshot.data.documentFile1,
                                  );
                                },
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                leading: Icon(Icons.file_present),
                                title: Text(
                                  isNullOrEmpty(snapshot.data.documentTitle1)
                                      ? ""
                                      : snapshot.data.documentTitle1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(
                                        color: Color(0xff727fc8),
                                        fontWeight: FontWeight.normal,
                                        fontSize: ScreenUtil().setSp(12),
                                      ),
                                ),
                              ),
                        snapshot.data.documentFile2 == null ||
                                snapshot.data.documentFile2 == ""
                            ? Container()
                            : ListTile(
                                onTap: () {
                                  showDownloadAlertDialog(
                                    context,
                                    snapshot.data.documentTitle2,
                                    snapshot.data.documentFile2,
                                  );
                                },
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                leading: Icon(Icons.file_present),
                                title: Text(
                                  isNullOrEmpty(snapshot.data.documentTitle2) ? "" : snapshot.data.documentTitle2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(
                                        color: Color(0xff727fc8),
                                        fontWeight: FontWeight.normal,
                                        fontSize: ScreenUtil().setSp(12),
                                      ),
                                ),
                              ),
                        snapshot.data.documentFile3 == null ||
                                snapshot.data.documentFile3 == ""
                            ? Container()
                            : ListTile(
                                onTap: () {
                                  showDownloadAlertDialog(
                                    context,
                                    snapshot.data.documentTitle3,
                                    snapshot.data.documentFile3,
                                  );
                                },
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                leading: Icon(Icons.file_present),
                                title: Text(
                                  isNullOrEmpty(snapshot.data.documentTitle3) ? "" : "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(
                                        color: Color(0xff727fc8),
                                        fontWeight: FontWeight.normal,
                                        fontSize: ScreenUtil().setSp(12),
                                      ),
                                ),
                              ),
                        snapshot.data.documentFile4 == null ||
                                snapshot.data.documentFile4 == ""
                            ? Container()
                            : ListTile(
                                onTap: () {
                                  showDownloadAlertDialog(
                                    context,
                                    snapshot.data.documentTitle4,
                                    snapshot.data.documentFile4,
                                  );
                                },
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                leading: Icon(Icons.file_present),
                                title: Text(
                                  isNullOrEmpty(snapshot.data.documentTitle4) ? "" : snapshot.data.documentTitle4,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(
                                        color: Color(0xff727fc8),
                                        fontWeight: FontWeight.normal,
                                        fontSize: ScreenUtil().setSp(12),
                                      ),
                                ),
                              ),
                      ],
                    ),
                  ),
                );
              } else {
                return ShimmerList(
                  itemCount: 3,
                  height: 100,
                );
              }
            },
          );
        },
      ),
    );
  }

  Widget getParentDetails() {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: FutureBuilder(
        future: Utils.getStringValue('password'),
        builder: (context, snapshot) {
          _password = snapshot.data;

          profileService = id == null
              ? ProfileService(
                  email: _email, password: _password, schoolId: schoolId)
              : ProfileService(id: id, token: _token);

          return FutureBuilder<UserDetails>(
            future: fetchParentDetails(),
            builder:
                (BuildContext context, AsyncSnapshot<UserDetails> snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Father",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(color: Color(0xff727fc8)),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: CircleAvatar(
                              radius: ScreenUtil().setSp(25),
                              child: CachedNetworkImage(
                                imageUrl: snapshot.data.fathersPhoto == null ||
                                        snapshot.data.fathersPhoto == ''
                                    ? "https://i.imgur.com/7PqjiH7.jpeg"
                                    : InfixApi.root +
                                        snapshot.data.fathersPhoto,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CupertinoActivityIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ParentsDetailsRow(
                                    title: "Name",
                                    value: snapshot.data.fathersName,),
                                GestureDetector(
                                  onTap: () async {
                                    await canLaunch(
                                            'tel:${snapshot.data.fathersMobile}')
                                        ? await launch(
                                            'tel:${snapshot.data.fathersMobile}')
                                        : throw 'Could not launch ${snapshot.data.fathersMobile}';
                                  },
                                  child: ParentsDetailsRow(
                                    title: "Phone",
                                    value: snapshot.data.fathersMobile,
                                  ),
                                ),
                                ParentsDetailsRow(
                                  title: "Occupation",
                                  value: snapshot.data.fathersOccupation,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Mother",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(color: Color(0xff727fc8)),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: CircleAvatar(
                              radius: ScreenUtil().setSp(25),
                              child: CachedNetworkImage(
                                imageUrl: snapshot.data.mothersPhoto == null ||
                                        snapshot.data.mothersPhoto == ''
                                    ? "https://i.imgur.com/7PqjiH7.jpeg"
                                    : InfixApi.root +
                                        snapshot.data.mothersPhoto,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CupertinoActivityIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ParentsDetailsRow(
                                  title: "Name",
                                  value: snapshot.data.mothersName,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await canLaunch(
                                            'tel:${snapshot.data.mothersMobile}')
                                        ? await launch(
                                            'tel:${snapshot.data.mothersMobile}')
                                        : throw 'Could not launch ${snapshot.data.mothersMobile}';
                                  },
                                  child: ParentsDetailsRow(
                                    title: "Phone",
                                    value: snapshot.data.mothersMobile,
                                  ),
                                ),
                                ParentsDetailsRow(
                                  title: "Occupation",
                                  value: snapshot.data.mothersOccupation,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Guardian",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(color: Color(0xff727fc8)),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: CircleAvatar(
                              radius: ScreenUtil().setSp(25),
                              child: CachedNetworkImage(
                                imageUrl: buildGuardianPhoto(snapshot.data),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CupertinoActivityIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ParentsDetailsRow(
                                  title: "Name",
                                  value: snapshot.data.guardiansName,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await canLaunch(
                                            'mailto:${snapshot.data.guardiansEmail}')
                                        ? await launch(
                                            'mailto:${snapshot.data.guardiansEmail}')
                                        : throw 'Could not launch ${snapshot.data.guardiansEmail}';
                                  },
                                  child: ParentsDetailsRow(
                                    title: "Email",
                                    value: snapshot.data.guardiansEmail,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await canLaunch(
                                            'tel:${snapshot.data.guardiansMobile}')
                                        ? await launch(
                                            'tel:${snapshot.data.guardiansMobile}')
                                        : throw 'Could not launch ${snapshot.data.guardiansMobile}';
                                  },
                                  child: ParentsDetailsRow(
                                    title: "Phone",
                                    value: snapshot.data.guardiansMobile,
                                  ),
                                ),
                                ParentsDetailsRow(
                                  title: "Occupation",
                                  value:
                                      snapshot.data.guardiansOccupation,
                                ),
                                ParentsDetailsRow(
                                  title: "Relation",
                                  value: snapshot.data.guardiansRelation,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return ShimmerList(
                  itemCount: 3,
                  height: 100,
                );
              }
            },
          );
        },
      ),
    );
  }

  // ignore: missing_return
  String buildGuardianPhoto(UserDetails userDetails) {
    if (userDetails.relation == 'Father') {
      if (userDetails.fathersPhoto == null || userDetails.fathersPhoto == '') {
        return InfixApi.root + 'public/uploads/staff/demo/staff.jpg';
      } else {
        return InfixApi.root + userDetails.fathersPhoto;
      }
    } else if (userDetails.relation == 'Mother') {
      if (userDetails.mothersPhoto == null || userDetails.mothersPhoto == '') {
        return InfixApi.root + 'public/uploads/staff/demo/staff.jpg';
      } else {
        return InfixApi.root + userDetails.mothersPhoto;
      }
    } else {
      if (userDetails.guardiansPhoto == null ||
          userDetails.guardiansPhoto == '') {
        return InfixApi.root + 'public/uploads/staff/demo/staff.jpg';
      } else {
        return InfixApi.root + userDetails.guardiansPhoto;
      }
    }
  }

  Future<UserDetails> fetchParentDetails() async {
    final response = await http.get(
        Uri.parse(id == null
            ? InfixApi.login(_email, _password)
            : InfixApi.getChildren(id)),
        headers: id == null ? null : Utils.setHeader(_token.toString()));

    print(response.body);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return UserDetails.fromJson(jsonData['data']['userDetails']);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Widget getProfileList(int index) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.symmetric(horizontal: 22),
      color: Colors.white,
      child: FutureBuilder(
        future: Utils.getStringValue('password'),
        builder: (context, snapshot) {
          _password = snapshot.data;

          profileService = id == null
              ? ProfileService(
                  email: _email, password: _password, schoolId: schoolId)
              : ProfileService(id: id, token: _token);

          return FutureBuilder(
            future: profileService.fetchPersonalServices(index),
            builder:
                (BuildContext context, AsyncSnapshot<List<InfixMap>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProfileRowList(
                        snapshot.data[index].key, snapshot.data[index].value);
                  },
                );
              } else {
                return ShimmerList(
                  itemCount: 4,
                  height: 30,
                );
              }
            },
          );
        },
      ),
    );
  }

  Widget getProfileHeader() {
    return FutureBuilder(
        future: Utils.getStringValue('password'),
        builder: (context, snapshot) {
          _password = snapshot.data;
          profileService = id == null
              ? ProfileService(
                  email: _email, password: _password, schoolId: schoolId)
              : ProfileService(id: id, token: _token);

          return FutureBuilder(
            future: profileService.fetchPersonalServices(4),
            builder: (context, snapshot1) {
              if (snapshot1.data != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      snapshot1.data[0].value,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(14),
                          ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Class : ' +
                          snapshot1.data[2].value +
                          ' | Section : ' +
                          snapshot1.data[1].value,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Color(0xFF727FC8),
                            fontWeight: FontWeight.normal,
                            fontSize: ScreenUtil().setSp(12),
                          ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Roll : ' +
                          snapshot1.data[3].value +
                          ' | Admission : ' +
                          snapshot1.data[4].value,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Color(0xFF727FC8),
                            fontWeight: FontWeight.normal,
                            fontSize: ScreenUtil().setSp(12),
                          ),
                    ),
                  ],
                );
              } else {
                return ShimmerList(
                  itemCount: 3,
                  height: 10,
                );
              }
            },
          );
        });
  }

  void navigateToPreviousPage(BuildContext context) {
    Navigator.pop(context);
  }

  Future<String> getImageUrl(String email, String password, String rule) async {
    var image = 'https://i.imgur.com/BoN9kdC.png';

    var response = await http.get(Uri.parse(InfixApi.login(email, password)));

    if (response.statusCode == 200) {
      Map<String, dynamic> user = jsonDecode(response.body) as Map;

      if (rule == '2')
        image = user['data']['userDetails']['student_photo'];
      else
        image = user['data']['userDetails']['staff_photo'];
    }
    return InfixApi.root + '$image';
  }

  showDownloadAlertDialog(BuildContext context, String title, String fileUrl) {
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
        downloadFile(fileUrl, context, title);
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

  Future<void> downloadFile(
      String url, BuildContext context, String title) async {
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
        progress =
            ((receivedBytes / totalBytes) * 100).toStringAsFixed(0) + "%";
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
            await canLaunch(InfixApi.root + url)
                ? await launch(InfixApi.root + url)
                : throw 'Could not launch ${InfixApi.root + url}';
          }
          Utils.showToast(
              "Download Completed. File is also available in your download folder.");
        }
      });
    } catch (e) {
      print(e);
    }
    progress = "Download Completed.Go to the download folder to find the file";
  }

  Future<void> checkPermissions(BuildContext context) async {
    Map<Permission, PermissionState> permission =
        await PermissionsPlugin.checkPermissions([
      Permission.WRITE_EXTERNAL_STORAGE,
    ]);

    if (permission[Permission.WRITE_EXTERNAL_STORAGE] !=
        PermissionState.GRANTED) {
      try {
        permission = await PermissionsPlugin.requestPermissions([
          Permission.WRITE_EXTERNAL_STORAGE,
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

class ProfileDetailsRow extends StatelessWidget {
  ProfileDetailsRow({this.title, this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? "",
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: Color(0xff727fc8),
                        fontWeight: FontWeight.normal,
                        fontSize: ScreenUtil().setSp(12),
                      ),
                ),
                SizedBox(
                  height: 12.0.h,
                ),
                Container(
                  height: 0.2.h,
                  decoration: BoxDecoration(
                    color: Color(0xFF828BB2),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value ?? "",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: Color(0xff727fc8),
                        fontWeight: FontWeight.normal,
                        fontSize: ScreenUtil().setSp(12),
                      ),
                ),
                SizedBox(
                  height: 12.0.h,
                ),
                Container(
                  height: 0.2.h,
                  decoration: BoxDecoration(
                    color: Color(0xFF828BB2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ParentsDetailsRow extends StatelessWidget {
  final String title;
  final String value;

  ParentsDetailsRow({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? "",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: Color(0xff727fc8),
                        fontWeight: FontWeight.normal,
                        fontSize: ScreenUtil().setSp(12),
                      ),
                ),
                SizedBox(
                  height: 12.0.h,
                ),
                Container(
                  height: 0.2.h,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFF828BB2),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isNullOrEmpty(value) ? "" : value,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: Color(0xff727fc8),
                        fontWeight: FontWeight.normal,
                        fontSize: ScreenUtil().setSp(12),
                      ),
                ),
                SizedBox(
                  height: 12.0.h,
                ),
                Container(
                  height: 0.2.h,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFF828BB2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
bool isNullOrEmpty(Object o) => o == null || o == "";