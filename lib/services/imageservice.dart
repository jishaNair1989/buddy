import 'dart:developer';
import 'dart:io';
import 'package:buddy1/services/dio_intreceptor.dart';
import 'package:buddy1/utils/network_check.dart';
import 'package:buddy1/utils/url.dart';
import 'package:dio/dio.dart';

class ImageUploadservice {
  Future<String?> uploadImage(
      File file,
      ) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      'path': 'text',
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    if (await internetCheck()) {
      Dio dio = await InterceptorHelper().getApiClient();
      try {
        final response = await dio.post(Url.imageUpload, data: formData);

        log('image upload response: ${response.data}');
        // contentType: MediaType("image", basename(image.path)));
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log('============image uploadedddddddddd===========');
          return response.data['url'];
          //   return response.data;
        } else {
          return null;
        }
      } on DioError catch (e) {
        if (e.response!.statusCode == 401) {
          return null;
        }
        // else {
        //   final errorMessage = DioException.fromDioError(e).toString();
        //   ScaffoldMessenger.of(context)
        //       .showSnackBar(ShowDialogs.popUp(errorMessage));
        // }
      }
    }
    return null;
  }
}
