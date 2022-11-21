import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_parser/http_parser.dart';

import '../model/postveiw/newPost_model.dart';
import '../utils/url.dart';

class NewPost {
  Future<String> postImage(NewPostModel post) async {
    String defaultApiError = 'Something went wrong!';
    const FlutterSecureStorage storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    try {
      String fileName = post.file.split('/').last;

      String format = fileName.split('.').last;

      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(post.file,
            filename: fileName, contentType: MediaType('image', format)),
        //"caption": post.comments,
        // 'userId': post.userId
      });
      //dio.options.contentType = 'multipart/form-data';
      //dio.options.headers['Content-Type'] = 'multipart/form-data';

      var response = await Dio().post(Url.post, data: formData,
          onSendProgress: (int sent, int total) {
        print('$sent $total');
      },
          options: Options(
            headers: {
              "Authorization": "Bearer$token",
            },
          ));

      if (response.statusCode == 200) {
        log(response.data['message']);
        return response.data['message'];
      } else {
        throw defaultApiError;
      }
    } catch (e) {
      log(e.toString());

      throw handleError(e);
    }
  }

  String handleError(e) {
    String networkError = 'No connection';
    String defaultApiError = 'Something went wrong!';
    print(e.toString());
    if (e is DioError) {
      if (e.response == null) {
        return networkError;
      }
      if (e.message.startsWith('SocketException')) {
        log('network');
        return networkError;
      }
      if (e.response?.data is Map && e.response!.data['error'] != null) {
        return e.response!.data['error'];
      }
      log(e.response!.data!.toString());
      log('out');
      return defaultApiError;
    }
    return e.toString();
  }
}
