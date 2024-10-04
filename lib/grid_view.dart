import 'dart:developer';

import 'package:basic_widgets/base_class.dart';
import 'package:basic_widgets/provider/photos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridViewDemo extends StatefulWidget {
  const GridViewDemo({super.key});

  @override
  State<GridViewDemo> createState() => _GridViewDemoState();
}

class _GridViewDemoState extends BaseClass<GridViewDemo> {
  late PhotosProvider photosProvider;
  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    photosProvider = Provider.of<PhotosProvider>(context, listen: false);
    WidgetsFlutterBinding.ensureInitialized();
    photosProvider.getPhotos();
    controller.addListener(() {
      if ((controller.position.pixels == controller.position.maxScrollExtent) &&
          !photosProvider.isLoading &&
          photosProvider.pagingEnabled) {
        photosProvider.getPhotos(isNextPage: true);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Grid View'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Selector<PhotosProvider, bool>(
                builder: (context, value, child) {
                  if (value) {
                    return const LinearProgressIndicator();
                  } else {
                    return Container();
                  }
                },
                selector: (p0, p) {
                  return p.isLoading;
                },
              ),
              Selector<PhotosProvider, String>(
                builder: (context, value, child) {
                  if (value.isNotEmpty) {
                    return Center(child: Text(value));
                  } else {
                    return Container();
                  }
                },
                selector: (p0, p) {
                  return p.errorMsgs;
                },
              ),
              Expanded(child: Consumer<PhotosProvider>(
                builder: (context, p, child) {
                  return GridView.builder(
                    controller: controller,
                    itemCount: p.photos.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.0,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      final item = p.photos[index];
                      return Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              item.urls?.smallS3 ?? '',
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                photosProvider.likeUnlikePhoto(index);
                              },
                              icon: Icon(Icons.favorite_rounded,
                                  color: item.likedByUser! ? Colors.red : null))
                        ],
                      );
                    },
                  );
                },
              ))
            ],
          ),
        ));
  }
}
