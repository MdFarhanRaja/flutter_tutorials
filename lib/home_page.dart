import 'dart:developer';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    log('build......');
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Widgets'),
        centerTitle: false,
        leading: Icon(Icons.deblur),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                count++;
                log('$count');
                setState(() {});
              },
              icon: Icon(Icons.add)),
          IconButton(onPressed: () {}, icon: Icon(Icons.language))
        ],
      ),
      body: Center(
          child: Container(
              color: Colors.green[50],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'You clicked floating action button',
                  ),
                  Text(
                    '$count',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'times',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(text: 'You clicked floating action button\n'),
                      TextSpan(
                        text: '$count',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      TextSpan(text: '\ntimes')
                    ]),
                    textAlign: TextAlign.center,
                  )
                ],
              ))),
      floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            count++;
            log('$count');
            setState(() {});
          },
          elevation: 20,
          tooltip: 'Click Me',
          child: Text('Click')),
    );
  }
}
