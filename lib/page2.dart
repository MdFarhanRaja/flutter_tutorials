import 'package:basic_widgets/app_prefs.dart';
import 'package:basic_widgets/base_class.dart';
import 'package:basic_widgets/page1.dart';
import 'package:flutter/material.dart';

import 'app_utils.dart';

class Page2 extends StatefulWidget {
  String name;
  Page2(this.name, {super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends BaseClass<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: widget.name),
      body: Center(
          child: Column(
        children: [
          const Text('Welcome to Flutter!'),
          getVerticalGap(gapHeight: 70),
          Image.asset(
            'assets/logo.png',
            height: 64,
          ),
          getVerticalGap(gapHeight: 70),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Md Farhan');
              },
              child: Text('Send Data to Page 1')),
          getVerticalGap(gapHeight: 20),
          ElevatedButton(
              onPressed: () {
                AppPrefs().logoutUser();
                gotoNext(Page1());
              },
              child: Text('Logout')),
        ],
      )),
    );
  }
}
