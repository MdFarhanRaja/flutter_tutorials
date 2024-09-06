import 'package:basic_widgets/tabs/home.dart';
import 'package:basic_widgets/tabs/profile.dart';
import 'package:basic_widgets/tabs/search.dart';
import 'package:basic_widgets/tabs/settings.dart';
import 'package:basic_widgets/tabs/view.dart';
import 'package:flutter/material.dart';

class BottomNavigationDemo extends StatefulWidget {
  const BottomNavigationDemo({super.key});

  @override
  State<BottomNavigationDemo> createState() => _BottomNavigationDemoState();
}

class _BottomNavigationDemoState extends State<BottomNavigationDemo> {
  int selectedIndex = 0;
  final tabs = [
    const HomeTab(),
    const ViewTab(),
    const SettingsTab(),
    const SearchTab(),
    const ProfileTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bottom Navigation Bar'),
        ),
        body: tabs[selectedIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    spreadRadius: 2,
                    blurRadius: 9,
                    blurStyle: BlurStyle.normal)
              ],
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: NavigationBar(
                animationDuration: const Duration(milliseconds: 500),
                backgroundColor: Colors.grey,
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
                indicatorColor: Colors.black,
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  selectedIndex = value;
                  setState(() {});
                },
                destinations: const [
                  NavigationDestination(
                      icon: Icon(Icons.home),
                      selectedIcon: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      label: 'Home'),
                  NavigationDestination(
                      icon: Icon(Icons.list),
                      selectedIcon: Icon(
                        Icons.list,
                        color: Colors.white,
                      ),
                      label: 'View'),
                  NavigationDestination(
                      icon: Icon(Icons.settings),
                      selectedIcon: Icon(
                        Icons.settings,
                        color: Colors.red,
                      ),
                      label: 'Settings'),
                  NavigationDestination(
                      icon: Icon(Icons.search),
                      selectedIcon: Icon(
                        Icons.search,
                        color: Colors.green,
                      ),
                      label: 'Search'),
                  NavigationDestination(
                      icon: Icon(Icons.person),
                      selectedIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      label: 'Profile')
                ]),
          ),
        ));
  }
}
