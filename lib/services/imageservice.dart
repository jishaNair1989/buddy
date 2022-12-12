import 'dart:developer';
import 'dart:io';
import 'package:buddy1/model/createpost/imageresponse.dart';
import 'package:buddy1/services/dio_intreceptor.dart';
import 'package:buddy1/utils/network_check.dart';
import 'package:buddy1/utils/url.dart';
import 'package:dio/dio.dart';

class ImageUploadservice {
  Future<List<ImageResponse>>
  uploadImage(
      File file,
      ) async {
    print('sssssss');
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    if (await internetCheck()) {
      Dio dio = await InterceptorHelper().getApiClient();
      try {
        print('stttarted');
        final response = await dio.post(Url.imageUpload, data: formData);
        print('resppppp');
        log('image upload response: ${response. data}');
        // contentType: MediaType("image", basename(image.path)));
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log('============image uploadedddddddddd===========');
          // log(response.data['url'].toString());
          // log(response.data['url'].runtimeType.toString());
          return List.from(response.data.map((x) => ImageResponse.fromJson(x)));
          return response.data['url'];
          //   return response.data;
        } else {
          return [];
        }
      } on DioError catch (e) {
        print(e);
        if (e.response!.statusCode == 401) {
          return [];
        }
        // else {
        //   final errorMessage = DioException.fromDioError(e).toString();
        //   ScaffoldMessenger.of(context)
        //       .showSnackBar(ShowDialogs.popUp(errorMessage));
        // }
      } catch(e){
        print(e);
      }
    }
    return [];
  }
}
