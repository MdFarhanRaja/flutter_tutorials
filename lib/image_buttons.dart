import 'dart:developer';

import 'package:flutter/material.dart';

class ImageButtons extends StatefulWidget {
  const ImageButtons({super.key});

  @override
  State<ImageButtons> createState() => _ImageButtonsState();
}

class _ImageButtonsState extends State<ImageButtons> {
  int selectedValue = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image & Buttons'),
        elevation: 3,
      ),
      body: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      debugPrint('ElevatedButton Clicked......');
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.red,
                        shadowColor: Colors.blue,
                        elevation: 5,
                        side: const BorderSide(color: Colors.red, width: 2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        backgroundColor: Colors.green[50]),
                    child: const Text(
                      'Click Me',
                      style: TextStyle(color: Colors.black),
                    )),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      debugPrint('TextButton Clicked......');
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    child: const Text('View All')),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Network Image',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(128),
                    child: Image.network(
                      'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
                      height: 128,
                      width: 128,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        return child;
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox(
                            height: 128, width: 128, child: Placeholder());
                      },
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Asset Image',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  'assets/images/logo.png',
                  height: 72,
                ),
              ],
            ),
          )),
    );
  }
}
