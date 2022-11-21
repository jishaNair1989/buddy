import 'dart:developer';
import 'package:buddy1/model/postveiw/all_posts_model.dart';
import 'package:buddy1/services/dio_intreceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../utils/url.dart';
import 'dio_exceptions.dart';


class GetPostsService {
  Future<List<AllPostsModel>?> getPostRepo(context) async {
    Dio dio = await InterceptorHelper().getApiClient();
    try {
      final Response response = await dio.get(Url.getAllPosts);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('all posts fetched');
        final dataList = (response.data as List).map((e) {
          return AllPostsModel.fromJson(e);
        }).toList();
        return dataList;
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
    } on Exception {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Connection Error ")));
    }
    return null;
  }
}
