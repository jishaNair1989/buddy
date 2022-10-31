//import 'dart:developer';
import 'package:buddy1/model/signin/sign_in_model.dart';
import 'package:buddy1/services/dio_exceptions.dart';
import 'package:buddy1/utils/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../model/signin/sign_in_resp_model.dart';
import '../utils/network_check.dart';
import 'dio_service.dart';

class SignInService {
  Future<SignInResponseModel?> signInRepo(SignInModel data, context) async {
    if (await internetCheck()) {
      try {
        final response =
            await DioService.postMethod(url: Url.login, value: data.toJson());
        if (response.statusCode >= 200 && response.statusCode <= 299) {
          // print("got response");


          return SignInResponseModel.fromJson(response.data);
        } else {
          return SignInResponseModel(
              message: "Invalid credentials.Please try again !!",
              verified: false);
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
