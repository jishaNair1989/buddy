import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/signup/sign_up_model.dart';
import '../model/signup/sign_up_resp_model.dart';
import '../utils/network_check.dart';
import '../utils/url.dart';
import 'dio_exceptions.dart';
import 'dio_service.dart';

class SignUpService {
  Future<SignUpResponseModel?> signUpRepo(SignUpModel data, context) async {
    if (await internetCheck()) {
      try {
        final response =
            await DioService.postMethod(url: Url.signup, value: data.toJson());
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return SignUpResponseModel.fromJson(response.data);
        } else {
          return SignUpResponseModel(
              message: 'Something Went Wrong', verified: true);
        }
      } on DioError catch (e) {
        final errMsg = DioException.fromDioError(e).toString();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          errMsg.toString(),
          style: const TextStyle(color: Colors.red),
        )));
      }

      return null;
    }
    return null;
  }
}
