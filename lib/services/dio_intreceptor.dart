import 'dart:developer';
import 'package:buddy1/utils/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class InterceptorHelper {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio(BaseOptions(baseUrl: Url.baseUrl));

  Future<Dio> getApiClient() async {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) async {
              final token = await getToken();
              dio.interceptors.clear();
              request.headers.addAll({
              "Authorization": "Bearer $token",
               });
              return handler.next(request);
              },
        onResponse: ((response, handler) => handler.next(response)),
        onError: (e, handler) async {
          if (e.response?.statusCode == 403) {
            final refreshToken = await getRefreshToken();
           // log("Refresh Token $refreshToken");
            try {
              await dio.post('/account/refresh-token',
                  data: {'refreshToken': refreshToken}).then(
                (value) async {
                  if (value.statusCode == 200) {
                    final object = value.data["token"];
                    await addToSecureStorage(object);
                    e.requestOptions.headers.addAll({
                      "Authorization": "Bearer $object",
                    });
                    final options = Options(
                      method: e.requestOptions.method,
                      headers: e.requestOptions.headers,
                    );
                    final cloneRequest = await dio.request(
                      e.requestOptions.path,
                      options: options,
                      data: e.requestOptions.data,
                      queryParameters: e.requestOptions.queryParameters,
                    );
                    return handler.resolve(cloneRequest);
                  }
                  return handler.next(e);
                },
              );
            } catch (e) {
              log(e.toString());
            }
          }
        },
      ),
    );
    return dio;
  }

  Future<String> getToken() async {
    return await storage.read(key: "token") ?? "";
  }

  Future<String> getRefreshToken() async {
    return await storage.read(key: "refreshToken") ?? "";
  }

  Future<void> addToSecureStorage(String value) async {
    await storage.write(key: "token", value: value);
    //await storage.write(key: 'id', value: value);
  }
}
