import 'dart:developer';

import 'package:basic_widgets/network/api_client.dart';
import 'package:basic_widgets/network/api_constants.dart';
import 'package:basic_widgets/network/api_response.dart';
import 'package:dio/dio.dart';

class ApiCall {
  static makeApiCall(String apiPath, Method method,
      ApiResponse apiResponseListener, ApiName apiName) async {
    final dio = ApiClient.getInstance();
    dio.options.headers["Authorization"] =
        "Bearer ZGZxfpQ31Yd1bjWf2Muxw42zX6k1ymgE59YNcdLenJ4";
    try {
      switch (method) {
        case Method.GET:
          final response = await dio.get(apiPath);
          apiResponseListener.onResponse(response.data, apiName);
          break;
        case Method.POST:
          final response = await dio.post(apiPath);
          apiResponseListener.onResponse(response.data, apiName);
          break;
        case Method.DELETE:
          final response = await dio.delete(apiPath);
          apiResponseListener.onResponse(response.data, apiName);
          break;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        apiResponseListener.onError(
            "${e.response?.statusCode} ${e.response?.statusMessage} ${e.response}",
            apiName);
      } else {
        apiResponseListener.onError("Something went wrong....", apiName);
      }
    }
  }
}
