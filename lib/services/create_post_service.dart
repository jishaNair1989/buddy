import 'dart:developer';

import 'package:buddy1/model/createpost/createpostmodel.dart';
import 'package:buddy1/model/createpost/createpostrespo.dart';
import 'package:buddy1/services/dio_exceptions.dart';
import 'package:buddy1/services/dio_intreceptor.dart';
import 'package:buddy1/utils/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class CreatePostService {



  Future<CreatepostRes?> CreateService(CreatepostModel data, context) async {
    //  print('startedapplying');
    Dio dios = await InterceptorHelper().getApiClient();

      // print('connected');
      try {


        // print(data.toJson());
        Response response =
        await dios.post(Url.newPost, data: data.toJson());
        log(response.toString());
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log('data posted success');
          log(response.toString());
          return CreatepostRes();
        } else if (response.statusCode! == 400) {
          log("Haiii");
          return CreatepostRes();
        } else {
          return CreatepostRes();
        }
      } on DioError catch (e) {
        log('Hai');
        log(e.toString());
        final errormsg = DioException.fromDioError(e).toString();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(errormsg)));
      }

    return null;
    //
  }
}
