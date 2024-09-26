import 'dart:developer';

import 'package:basic_widgets/base_class.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'models/post_data.dart';

class RestApiDemo extends StatefulWidget {
  const RestApiDemo({super.key});

  @override
  State<RestApiDemo> createState() => _RestApiDemoState();
}

class _RestApiDemoState extends BaseClass<RestApiDemo> {
  List<PostData> postList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Rest API Demo'),
      body: Column(
        children: [
          Expanded(
              child: ListView.separated(
            separatorBuilder: (context, index) {
              return getVerticalGap(gapHeight: 10);
            },
            padding: EdgeInsets.all(20),
            itemCount: postList.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('#${postList[index].id.toString()}'),
                  Text(postList[index].title.toString().toUpperCase()),
                  getVerticalGap(gapHeight: 5),
                  Text(
                    postList[index].body ?? '',
                  ),
                  getVerticalGap(gapHeight: 10),
                  Divider()
                ],
              );
            },
          )),
          ElevatedButton(
              onPressed: () {
                getPosts();
              },
              child: Text('GET POSTS')),
          getVerticalGap()
        ],
      ),
    );
  }

  void getPosts() async {
    final dio = Dio();
    final postResponse =
        await dio.get("https://jsonplaceholder.typicode.com/posts");
    final posts = postResponse.data as List<dynamic>;

/*  posts.forEach((element) {
      final p = PostData(
          id: element['id'], title: element['title'], body: element['body']);
      postList.add(p);
    }); */

    final l = posts.map((e) => PostData.fromJson(e)).toList();
    postList.clear();
    postList.addAll(l);
    log(postList.length.toString());
    setState(() {});
  }
}
