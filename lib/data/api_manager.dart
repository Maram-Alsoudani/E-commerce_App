import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/api_constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  Dio dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {'Content-Type': 'application/json'},
      responseType: ResponseType.json,
      validateStatus: (status) => true,
    ),
  );

  Future<Response> getDate(String endPoint,
      {Map<String, dynamic>? queryParameters}) {
    return dio.get("${ApiConstants.baseUrl}$endPoint",
        queryParameters: queryParameters);
  }

  Future<Response> postDate(String endPoint,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) {
    return dio.post("${ApiConstants.baseUrl}$endPoint",
        data: body, options: Options(headers: headers));
  }
}
