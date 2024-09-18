import 'dart:developer';

import 'package:basic_widgets/app_prefs.dart';
import 'package:basic_widgets/page1.dart';
import 'package:basic_widgets/page2.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final v = await AppPrefs().isLoggedin();
  log(v.toString());
  runApp(MainApp(v));
/*   if (v) {
    runApp(Home());
  } else {
    runApp(Login());
  } */
  //runApp(v == true ? Home() : Login());
}

class MainApp extends StatelessWidget {
  bool isLoggedIn;
  MainApp(this.isLoggedIn, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Basic Widgets',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: isLoggedIn == true ? Page2('Farhan') : Page1());
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

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

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Basic Widgets',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Page2('Farhan'));
  }
}
