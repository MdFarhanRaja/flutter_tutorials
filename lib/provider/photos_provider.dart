import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/photos_item.dart';

class PhotosProvider extends ChangeNotifier {
  int perPage = 20, currentPage = 1;
  List<PhotosItem> photos = [];
  bool isLoading = true;

  void getPhotos({bool isNextPage = false}) async {
    if (isNextPage) {
      currentPage++;
      isLoading = true;
      notifyListeners();
    }
    final dio = Dio();
    final headers = {
      'Authorization': 'Bearer ZGZxfpQ31Yd1bjWf2Muxw42zX6k1ymgE59YNcdLenJ4'
    };
    final photoResponse = await dio.get(
        "https://api.unsplash.com/photos?per_page=$perPage&page=$currentPage",
        options: Options(headers: headers));
    if (photoResponse.statusCode == 200) {
      final photoItems = photoResponse.data as List<dynamic>;
      final items = photoItems.map((e) => PhotosItem.fromJson(e)).toList();
      photos.addAll(items);
    } else {
      log(photoResponse.statusMessage ?? '');
    }
    isLoading = false;
    notifyListeners();
  }
}
