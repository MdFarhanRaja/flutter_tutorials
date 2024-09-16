import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  static Widget getVerticalGap({double gapHeight = 20}) {
    return SizedBox(height: gapHeight);
  }

  static showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static AppBar getAppBar({String? title}) {
    return AppBar(title: title != null ? Text(title) : null);
  }

  static Future<Object?> gotoNext(Widget w, BuildContext c) async {
    return await Navigator.push(c, MaterialPageRoute(builder: (context) => w));
  }
}
