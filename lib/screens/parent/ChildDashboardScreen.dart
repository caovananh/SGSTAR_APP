// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

// Project imports:
import 'package:infixedu/utils/CardItem.dart';
import 'package:infixedu/utils/CustomAppBarWidget.dart';
import 'package:infixedu/utils/FunctinsData.dart';

// ignore: must_be_immutable
class ChildHome extends StatefulWidget {
  var _titles;
  var _images;
  dynamic id;
  String profileImage;
  String token;
  String name;

  ChildHome(this._titles, this._images, this.id, this.profileImage,this.token,this.name);

  @override
  _ChildHomeState createState() => _ChildHomeState(_titles, _images,token,name);
}

class _ChildHomeState extends State<ChildHome> {
  bool isTapped;
  dynamic currentSelectedIndex;
  var _titles;
  var _images;
  String _token;
  String _name;

  _ChildHomeState(this._titles, this._images,this._token,this._name);

  @override
  void initState() {
    super.initState();
    isTapped = false;
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
          title: _name +' Dashboard',
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: GridView.builder(
            itemCount: _titles.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) {
              return CustomWidget(
                index: index,
                isSelected: currentSelectedIndex == index,
                onSelect: () {
                  setState(() {
                    currentSelectedIndex = index;
                    AppFunction.getDashboardPage(context, _titles[index],
                        id: widget.id.toString(), image: widget.profileImage,token: _token);
                  });
                },
                headline: _titles[index],
                icon: _images[index],
              );
            },
          ),
        ),
      ),
    );
  }
}

//Future<String> getImageUrl(String email, String password, String rule) async {
//  var image = 'https://i.imgur.com/BoN9kdC.png';
//
//  var response = await http.get(InfixApi.login(email, password));
//
//  if (response.statusCode == 200) {
//    Map<String, dynamic> user = jsonDecode(response.body) as Map;
//
//    if (rule == '2')
//      image = InfixApi.root + user['data']['userDetails']['student_photo'];
//    else
//      image = InfixApi.root + user['data']['userDetails']['staff_photo'];
//  }
//  return '$image';
//}

void navigateToPreviousPage(BuildContext context) {
  Navigator.pop(context);
}
