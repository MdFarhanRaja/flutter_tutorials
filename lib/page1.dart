import 'dart:developer';
import 'package:basic_widgets/app_utils.dart';
import 'package:basic_widgets/base_class.dart';
import 'package:basic_widgets/page2.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends BaseClass<Page1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(),
        body: Center(
            child: Column(
          children: [
            Text('Welcome to Flutter!', style: regularStyle(fontSize: 30)),
            getVerticalGap(gapHeight: 70),
            Image.asset(
              'assets/logo.png',
              height: 64,
            ),
            getVerticalGap(gapHeight: 70),
            ElevatedButton(
                onPressed: () {
                  gotoNextPage();
                },
                child: Text(
                  'Goto Page 2',
                  style: regularStyle(fontSize: 10, fontColor: Colors.red),
                )),
          ],
        )));
  }

  void gotoNextPage() async {
    final result = await gotoNext(Page2('Md'));
    if (result != null) {
      log(result.toString());
    } else {
      log('No data returned');
    }

/*     Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Page2();
    })); */
  }
}
