import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class Interceptorapi {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio();

  Future<Dio> getApiUser() async {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (response, handler) async {
      String? token = await storage.read(key: "token");
      // log(token.toString());
      dio.interceptors.clear();
      response.headers.addAll({"Authorization": "Bearer $token"});
      return handler.next(response);
    }, onError: (e, handler) async {
      if (e.response?.statusCode == 401) {
        return;
      }
    }, onResponse: ((kResponse, response) {
      return response.next(kResponse);
    })));
    return dio;
  }
}
