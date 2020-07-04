import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    print(
        "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl ?? "") + (options.path ?? "")}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters != null) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");
    // options.headers.addAll({"Authorization": "Bearer $token"});

    return options;
  }
}

@override
FutureOr<dynamic> onResponse(Response response) async {
  print(
      "<-- ${response.statusCode} ${(response.request != null ? (response.request.baseUrl + response.request.path) : 'URL')}");
  print("Headers:");
  response.headers?.forEach((k, v) => print('$k: $v'));
  print("Response: ${response.data}");
  print("<-- END HTTP");
  // }
  return response;
}

@override
FutureOr<dynamic> onError(DioError dioError) {
  switch (dioError.type) {
    case DioErrorType.CANCEL:
      dioError.error = "Request to API server was cancelled";
      break;
    case DioErrorType.CONNECT_TIMEOUT:
      dioError.error = "Connection timeout with API server";
      break;
    case DioErrorType.DEFAULT:
      dioError.error =
          "Connection to API server failed due to internet connection";
      break;
    case DioErrorType.RECEIVE_TIMEOUT:
      dioError.error = "Receive timeout in connection with API server";
      break;
    case DioErrorType.RESPONSE:
      dioError.error =
          "Received invalid status code: ${dioError.response.statusCode}";
      break;
    default:
      dioError.error = "Unexpected error occured";
  }
  return dioError;
}
