import 'package:buddy1/model/postveiw/all_post_model.dart';
import 'package:buddy1/services/dio_service.dart';
import 'package:buddy1/utils/url.dart';

class CreatePostService {
   Future<Slots?> createPost(String text, String user)async {
    DioService.postMethod(url: Url.newPost, value: {'text': text, "user" :user});
  }
}
