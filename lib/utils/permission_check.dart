// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:permissions_plugin/permissions_plugin.dart';

class PermissionCheck{

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
