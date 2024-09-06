import 'package:flutter/material.dart';

class ViewTab extends StatefulWidget {
  const ViewTab({super.key});

  @override
  State<ViewTab> createState() => _ViewTabState();
}

class _ViewTabState extends State<ViewTab> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('View Tab'));
  }
}
