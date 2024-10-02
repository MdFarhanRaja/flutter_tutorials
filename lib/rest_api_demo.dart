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
  void initState() {
    //WidgetsFlutterBinding.ensureInitialized();
    //getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('Widget build');
    return Scaffold(
      appBar: getAppBar(title: 'Rest API Demo'),
      body: Column(
        children: [
          FutureBuilder(
            future: getPostsWithFuture(),
            builder: (context, snapshot) {
              // snapshot.connectionState == ConnectionState.waiting
              return !snapshot.hasData
                  ? Expanded(
                      child: Center(
                        child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator()),
                      ),
                    )
                  : Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return getVerticalGap(gapHeight: 10);
                        },
                        padding: EdgeInsets.all(20),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('#${snapshot.data![index].id.toString()}'),
                              Text(snapshot.data![index].title
                                  .toString()
                                  .toUpperCase()),
                              getVerticalGap(gapHeight: 5),
                              Text(
                                snapshot.data![index].body ?? '',
                              ),
                              getVerticalGap(gapHeight: 10),
                              Divider()
                            ],
                          );
                        },
                      ),
                    );
            },
          ),
          ElevatedButton(
              onPressed: () {
                //getPosts();
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

  Future<List<PostData>> getPostsWithFuture() async {
    await Future.delayed(Duration(seconds: 5));
    final dio = Dio();
    final postResponse =
        await dio.get("https://jsonplaceholder.typicode.com/posts");
    final posts = postResponse.data as List<dynamic>;
    final l = posts.map((e) => PostData.fromJson(e)).toList();
    return Future.value(l);
  }
}
