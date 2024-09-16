import 'dart:developer';

import 'package:flutter/material.dart';

class MethodsDemo extends StatefulWidget {
  const MethodsDemo({super.key});

  @override
  State<MethodsDemo> createState() => _MethodsDemoState();
}

class _MethodsDemoState extends State<MethodsDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Methods Examples'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Click to Execute Methods'),
            getVerticalGap(gapHeight: 10),
            ElevatedButton(
                onPressed: () async {
                  //nonReturnTypeMethod(null, 3.5);
                  //final r = returnTypeMethod(100, 10.4);
                  //log(r.toString());
                  //optionalParameterMethod(100, b: 4, c: 5);
                  double f = await futureMethod(100, 10);
                  log(f.toString());
                },
                child: Text('Execute Method'))
          ],
        ),
      ),
    );
  }

  void nonReturnTypeMethod(int? a, double b) {
    log('nonReturnTypeMethod executed successfully with data $a $b');
  }

  double returnTypeMethod(int? a, double b) {
    log('returnTypeMethod executed successfully with data $a $b');
    return (a! / b);
  }

  double optionalParameterMethod(int a, {int? b, int? c}) {
    log('optionalParameterMethod executed successfully with data $a $b $c');
    return 0;
  }

  Widget getVerticalGap({double gapHeight = 20}) {
    return SizedBox(height: gapHeight);
  }

  Future<double> futureMethod(int a, double b) async {
    await Future.delayed(Duration(seconds: 5));
    return Future.value((a / b));
  }
}
