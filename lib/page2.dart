import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  String name;
  Page2(this.name, {super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Farhan');
              },
              child: Text('Send Data to Page 1'))),
    );
  }
}
