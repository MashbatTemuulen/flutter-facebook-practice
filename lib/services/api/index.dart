import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService()
      : dio = Dio(BaseOptions(
          baseUrl: "http://192.168.1.16:8080",
          receiveTimeout: 30000,
          sendTimeout: 30000,
          // responseType: ResponseType.json,
        ));

  Future<Response> getRequest(String path, [bool isAuth = false]) async {
    if (isAuth) {
      return await dio.get(path,
          options: Options(headers: {"Authorization": "user"}));
    } else {
      return await dio.get(path);
    }
  }

  Future<Response> postRequest(String path,
      {bool isAuth = false, dynamic body}) async {
    if (isAuth) {
      return await dio.post(path,
          data: body, options: Options(headers: {"Authorization": ""}));
    } else {
      return await dio.post(path, data: body);
    }
  }

  Future<Response> putRequest(String path,
      {bool isAuth = false, dynamic body}) {
    if (isAuth) {
      return dio.put(path,
          data: body, options: Options(headers: {"Authorization": ""}));
    } else {
      return dio.put(path, data: body);
    }
  }

  Future<Response> deleteRequest(String path,
      {bool isAuth = false, dynamic body}) {
    if (isAuth) {
      return dio.delete(path,
          data: body, options: Options(headers: {"Authorization": ""}));
    } else {
      return dio.delete(path, data: body);
    }
  }
}
