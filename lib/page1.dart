import 'dart:developer';

import 'package:basic_widgets/page2.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  gotoNextPage();
                },
                child: Text('Goto Page 2'))));
  }

  void gotoNextPage() async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Page2('Md')));
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
