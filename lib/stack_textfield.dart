import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StackTextFields extends StatefulWidget {
  const StackTextFields({super.key});

  @override
  State<StackTextFields> createState() => _StackTextFieldsState();
}

class _StackTextFieldsState extends State<StackTextFields> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    log('build......');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Basic Widgets'),
          centerTitle: false,
          leading: const Icon(Icons.deblur),
          backgroundColor: Colors.white,
          actions: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                const Icon(
                  Icons.notifications,
                  size: 48,
                ),
                Container(
                  height: 20,
                  width: 20,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: const Text(
                    '2',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Text Field'.toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                const TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 3, 138, 52))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 10, 113, 203))),
                      label: Icon(Icons.person),
                      hintText: 'Enter Name',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red)),
                ),
                const SizedBox(height: 30),
                const TextField(
                    decoration: InputDecoration(
                  prefixText: '+91 | ',
                  prefixIcon: Icon(
                    Icons.mobile_screen_share_rounded,
                    color: Colors.amber,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 10, 113, 203))),
                  label: Icon(Icons.email_rounded),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                )),
                const SizedBox(height: 30),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const TextField(
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            border: InputBorder.none)))
              ],
            )));
  }
}
