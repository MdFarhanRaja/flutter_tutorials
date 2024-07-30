import 'package:flutter/material.dart';

class CalButton extends StatelessWidget {
  String title;
  Color? bgColor;
  Color? titleColor;
  void Function(String val) onClick;

  CalButton(
      {required this.title,
      required this.onClick,
      this.bgColor,
      this.titleColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onClick(title);
        },
        style: TextButton.styleFrom(
            backgroundColor: bgColor ?? Colors.grey,
            foregroundColor: titleColor ?? Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
        child: Text(
          title,
          style: TextStyle(fontSize: 25),
        ));
  }
}
