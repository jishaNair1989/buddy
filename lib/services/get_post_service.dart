import 'dart:developer';
import 'package:buddy1/model/postveiw/all_post_model.dart';
import 'package:buddy1/services/dio_intreceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../utils/url.dart';
import 'dio_exceptions.dart';

class GetPostsService {
  Future<Slots?> getPostRepo(context) async {
    Dio dio = await InterceptorHelper().getApiClient();
    try {
      final Response response = await dio.get(Url.getAllPosts);
      log(response.data.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        return Slots.fromJson(response.data);
      }
    } on DioError catch (e) {
      final errMsg = DioException.fromDioError(e).toString();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            errMsg.toString(),
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    }
    return null;
  }
}
