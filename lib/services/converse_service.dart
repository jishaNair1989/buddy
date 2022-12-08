import 'dart:developer';

import 'package:buddy1/utils/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../model/Conversations/conver_resp_model.dart';
import '../model/conversations/conversation_model.dart';
import 'dio_exceptions.dart';
import 'dio_intreceptor.dart';

class GetConversationService {
  Future<AllConversationResponse?> getConversations(context) async {
    Dio dio = await InterceptorHelper().getApiClient();
    try {
      final Response response = await dio.get(Url.conversations);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('all conv fetched');
        final dataList = (response.data as List).map((e) {
          return ConversationModel.fromJson(e);
        }).toList();
        return AllConversationResponse(dataList: dataList);
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
