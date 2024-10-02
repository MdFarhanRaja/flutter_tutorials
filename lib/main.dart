import 'package:basic_widgets/grid_view.dart';
import 'package:basic_widgets/page1.dart';
import 'package:basic_widgets/page2.dart';
import 'package:basic_widgets/provider/counter_provider.dart';
import 'package:basic_widgets/provider/photos_provider.dart';
import 'package:basic_widgets/provider_demo.dart';
import 'package:basic_widgets/rest_api_demo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(runWithProvider());
}

runWithProvider() {
  return MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CounterProvider()),
    ChangeNotifierProvider(create: (context) => PhotosProvider())
  ], child: MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Basic Widgets',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: GridViewDemo());
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
