import 'package:basic_widgets/network/api_constants.dart';

abstract class ApiResponse {
  void onResponse(dynamic response, ApiName apiName);
  void onError(dynamic errorMsg, ApiName apiName);
}
