import 'package:flutter/cupertino.dart';

import 'StudentScreen.dart';

class BouncyAnimation extends PageRouteBuilder{
  final Widget widget;

  BouncyAnimation({this.widget}) : super(
          transitionDuration: Duration(seconds: 1),
          reverseTransitionDuration: Duration(seconds: 1),
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child){
            // animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0,1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation){
            return widget;
          }
      );

}