import 'package:basic_widgets/alert_dialog.dart';
import 'package:basic_widgets/basic_calculator.dart';
import 'package:basic_widgets/bottom_navigation.dart';
import 'package:basic_widgets/grid_view.dart';
import 'package:basic_widgets/image_buttons.dart';
import 'package:basic_widgets/list_view.dart';
import 'package:basic_widgets/page1.dart';
import 'package:basic_widgets/radio_and_checkbox.dart';
import 'package:basic_widgets/stack_textfield.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Basic Widgets',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Page1());
  }
}
