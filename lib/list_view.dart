import 'dart:developer';

import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({super.key});

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List View'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Contact List Horizontal"),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(20),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return TextButton(
                        onPressed: () {
                          log("Item Clicked Position: $index");
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            side: BorderSide(),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(128),
                                child: Image.network(
                                  'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
                                  height: 48,
                                  width: 48,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    return child;
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return const SizedBox(
                                        height: 128,
                                        width: 128,
                                        child: Placeholder());
                                  },
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Name $index",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text("+91 123456778")
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ));
                  },
                ),
              ),
              Text("Contact List Vertical"),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(20),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return TextButton(
                        onPressed: () {
                          log("Item Clicked Position: $index");
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(128),
                                child: Image.network(
                                  'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
                                  height: 48,
                                  width: 48,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    return child;
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return const SizedBox(
                                        height: 128,
                                        width: 128,
                                        child: Placeholder());
                                  },
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Name $index",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text("+91 123456778")
                              ],
                            ),
                          ],
                        ));
                  },
                ),
              )
            ],
          ),
        ));
  }
}
