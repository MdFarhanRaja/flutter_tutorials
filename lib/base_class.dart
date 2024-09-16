import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class BaseClass<T extends StatefulWidget> extends State<T> {
  final String REGULAR = 'REGULAR', LIGHT = 'LIGHT';

  TextStyle regularStyle({double? fontSize, Color? fontColor}) {
    return TextStyle(fontFamily: REGULAR, fontSize: fontSize, color: fontColor);
  }

  TextStyle lightStyle() {
    return TextStyle(fontFamily: LIGHT);
  }

  Widget getVerticalGap({double gapHeight = 20}) {
    return SizedBox(height: gapHeight);
  }

  showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  AppBar getAppBar({String? title}) {
    return AppBar(title: title != null ? Text(title) : null);
  }

  Future<Object?> gotoNext(Widget w) async {
    return await Navigator.push(
        context, MaterialPageRoute(builder: (context) => w));
  }
}
