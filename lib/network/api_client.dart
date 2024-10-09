import 'package:basic_widgets/network/api_constants.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static Dio getInstance({String? baseUrl}) {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl ?? ApiConstants.BASE_URL,
        connectTimeout: const Duration(minutes: 5),
        receiveTimeout: const Duration(minutes: 5));
    return Dio(options);
  }
}
