import 'package:buddy1/model/postveiw/all_post_model.dart';
import 'package:buddy1/utils/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/postveiw/newPost_model.dart';
import 'api_service.dart';

class NewPostService extends ApiService {
  @override
  String setEndPoint() => '/createPost';

  Future<String> postImage({NewPostModel? post}) async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    try {
      // String fileName = post.file.split('/').last;
      // String format = fileName.split('.').last;
      // FormData formData = FormData.fromMap({
      //   "image": await MultipartFile.fromFile(post.file,
      //       filename: fileName, contentType: MediaType('image', format)),
      //   "comments": post.comments,
      //   'userId': post.userId
      // });
      // Dio().options.contentType = 'multipart/form-data';
      // Dio().options.headers['Content-Type'] = 'multipart/form-data';

      final Response response = await Dio().post(Url.post,
          data: post,
// {
//             "text": "good evening",
//             "user": "6343a19514cc2d05552ee165",
//             "images": [
//               "https://res.cloudinary.com/dhdsnaxj0/image/upload/v1667807197/cld-sample-4.jpg"
//             ]
//           },
          options: Options(headers: {
            "Authorization": "Bearer$token",
          }));
      if (response.statusCode == 200) {
        print('=========posted-=====');
        return '';
        //log(response.data['message']);
        //return response.data['message'];
      } else {
        //throw defaultApiError;
        print('nullllllllll');
        return '';
      }
    } catch (e) {
      //log(e.toString());
      //throw handleError(e);
      print('=============catch error===============');
      return '';
    }
  }

  Future<List<Slots>> getPosts() async {
    try {
      final response = await Dio().get('/timeline/${currUser!.id}');

      if (response.isOk) {
        return postsFromJson(response.data);
      } else {
        throw defaultApiError;
      }
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<void> likePost(String postId) async {
    try {
      final response =
          await Dio().put('/like/$postId', data: {'userId': currUser!.id});
      //log(response.data['message']);
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<bool> deletePost(String postId) async {
    try {
      final response =
          await Dio().delete('/$postId', data: {"userId": currUser!.id});
      if (response.isOk) {
        //log(response.data.toString());
        return true;
      }
      return false;
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<bool> reportPost(String postId) async {
    try {
      final response = await Dio().post('/reportPost/$postId');
      if (response.isOk) {
        return true;
      }
      return false;
    } catch (e) {
      throw handleError(e);
    }
  }
}
