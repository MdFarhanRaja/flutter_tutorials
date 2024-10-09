import 'dart:convert';
import 'dart:developer';
import 'package:basic_widgets/network/api_call.dart';
import 'package:basic_widgets/network/api_constants.dart';
import 'package:basic_widgets/network/api_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/photos_item.dart';

class PhotosProvider extends ChangeNotifier implements ApiResponse {
  int perPage = 20, currentPage = 1;
  List<PhotosItem> photos = [];
  bool isLoading = true, pagingEnabled = true;
  String errorMsgs = '';

  void getPhotosNew() {
    ApiCall.makeApiCall(
        ApiConstants.GET_PHOTOS, Method.GET, this, ApiName.GET_PHOTOS);
  }

  void likePhotoNew(int index) {
    final photoId = photos[index].id!;
    ApiCall.makeApiCall(
        ApiConstants.LIKE_UNLIKE_PHOTO.replaceFirst("%s", photoId),
        Method.POST,
        this,
        ApiName.LIKE_PHOTO);
  }

  void getPhotos({bool isNextPage = false}) async {
    if (isNextPage) {
      currentPage++;
      isLoading = true;
      notifyListeners();
    }
    try {
      final dio = Dio();
      final headers = {
        'Authorization': 'Bearer ZGZxfpQ31Yd1bjWf2Muxw42zX6k1ymgE59YNcdLenJ4'
      };
      final photoResponse = await dio.get(
          "https://api.unsplash.com/photos?per_page=$perPage&page=$currentPage",
          options: Options(headers: headers));
      final photoItems = photoResponse.data as List<dynamic>;
      final items = photoItems.map((e) => PhotosItem.fromJson(e)).toList();
      items.removeAt(0);
      items.removeAt(1);
      if (items.length < perPage) {
        pagingEnabled = false;
      }
      photos.addAll(items);
    } on DioException catch (e) {
      if (e.response != null) {
        //log("${e.response?.statusCode} ${e.response?.statusMessage} ${e.response}");
        final errorResp = jsonDecode(jsonEncode(e.response?.data));
        final errors = errorResp['errors'] as List<dynamic>;
        errors.insert(0, e.response?.statusCode.toString());
        errors.insert(1, e.response?.statusMessage);
        errorMsgs = errors.join('\n');
        //log(errors.length.toString());
      } else {
        log('Something went wrong....');
      }
    }
    isLoading = false;
    notifyListeners();
  }

  void likePhoto(int index) async {
    final photoId = photos[index].id!;
    try {
      final dio = Dio();
      final headers = {
        'Authorization': 'Bearer ZGZxfpQ31Yd1bjWf2Muxw42zX6k1ymgE59YNcdLenJ4'
      };
      final photoResponse = await dio.post(
          "https://api.unsplash.com/photos/$photoId/like",
          options: Options(headers: headers));
      log(photoResponse.data.toString());
      /* if (photoResponse.statusCode == 201) {
        photos[index].likedByUser = true;
        notifyListeners();
      } */
    } on DioException catch (e) {
      if (e.response != null) {
        log("${e.response?.statusCode} ${e.response?.statusMessage} ${e.response}");
      } else {
        log('Something went wrong....');
      }
    }
  }

  void unLikePhoto(int index) async {
    final photoId = photos[index].id!;
    try {
      final dio = Dio();
      final headers = {
        'Authorization': 'Bearer ZGZxfpQ31Yd1bjWf2Muxw42zX6k1ymgE59YNcdLenJ4'
      };
      final photoResponse = await dio.delete(
          "https://api.unsplash.com/photos/$photoId/like",
          options: Options(headers: headers));
      log(photoResponse.data.toString());
      /* if (photoResponse.statusCode == 200) {
        photos[index].likedByUser = false;
        notifyListeners();
      } */
    } on DioException catch (e) {
      if (e.response != null) {
        log("${e.response?.statusCode} ${e.response?.statusMessage} ${e.response}");
      } else {
        log('Something went wrong....');
      }
    }
  }

  void likeUnlikePhoto(int index) {
    final v = photos[index].isLiked;
    photos[index].likedByUser = !v;
    notifyListeners();
    if (v) {
      unLikePhoto(index);
      //photos[index].likedByUser = false;
      //notifyListeners();
    } else {
      //photos[index].likedByUser = true;
      //notifyListeners();
      likePhotoNew(index);
    }
  }

  @override
  void onError(dynamic errorMsg, ApiName apiName) {
    log("onError:> ${errorMsg.toString()}");
  }

  @override
  void onResponse(dynamic apiResponse, ApiName apiName) {
    switch (apiName) {
      case ApiName.GET_PHOTOS:
        log("onResponse $apiName:> ${apiResponse.toString()}");
        final photoItems = apiResponse as List<dynamic>;
        final items = photoItems.map((e) => PhotosItem.fromJson(e)).toList();
        items.removeAt(0);
        items.removeAt(1);
        if (items.length < perPage) {
          pagingEnabled = false;
        }
        photos.addAll(items);
        isLoading = false;
        notifyListeners();
        break;
      case ApiName.LIKE_PHOTO:
        log("onResponse $apiName:> ${apiResponse.toString()}");
        break;
      case ApiName.UNLIKE_PHOTO:
        break;
    }
  }
}
