// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:infixedu/screens/admin/Bloc/StaffBloc.dart';
import 'package:infixedu/utils/CardItem.dart';
import 'package:infixedu/utils/CustomAppBarWidget.dart';
import 'package:infixedu/utils/model/LibraryCategoryMember.dart';
import 'package:infixedu/utils/widget/ScaleRoute.dart';
import 'StaffListScreen.dart';

class AdminStaffList extends StatefulWidget {
  @override
  _AdminStaffListState createState() => _AdminStaffListState();
}

class _AdminStaffListState extends State<AdminStaffList> {
  int currentSelectedIndex;

  @override
  void initState() {
    super.initState();
    bloc.getStaff();
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
          title: 'Staff Category',
        ),
        body: StreamBuilder<LibraryMemberList>(
          stream: bloc.subject.stream,
          builder: (context, catSnap) {
            if (catSnap.hasData) {
              if (catSnap.error != null) {
                return _buildErrorWidget(catSnap.error.toString());
              }
              return _buildStaffWidget(catSnap.data);
            } else if (catSnap.hasError) {
              return _buildErrorWidget(catSnap.error);
            } else {
              return _buildLoadingWidget();
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget _buildStaffWidget(LibraryMemberList data) {
    return Container(
      child: GridView.builder(
        itemCount: data.members.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return CustomWidget(
            index: index,
            isSelected: currentSelectedIndex == index,
            onSelect: () {
              setState(() {
                currentSelectedIndex = index;
                // AppFunction.getAdminFeePage(context, _titles[index]);
                Navigator.push(context,
                    ScaleRoute(page: StaffListScreen(data.members[index].id)));
              });
            },
            headline: data.members[index].name,
            icon: 'assets/images/addhw.png',
          );
        },
      ),
    );
  }
}
