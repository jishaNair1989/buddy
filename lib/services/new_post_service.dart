// import 'package:buddy1/utils/url.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// import '../model/postveiw/newpost_model.dart';

// class NewPostService {
//   @override
//   String setEndPoint() => '/createPost';

//   Future<String> postImage({NewPostModel? post}) async {
//     const FlutterSecureStorage storage = FlutterSecureStorage();
//     final token = await storage.read(key: 'token');
//     try {
//       final Response response = await Dio().post(Url.post,
//           data: post,
// // {
// //             "text": "good evening",
// //             "user": "6343a19514cc2d05552ee165",
// //             "images": [
// //               "https://res.cloudinary.com/dhdsnaxj0/image/upload/v1667807197/cld-sample-4.jpg"
// //             ]
// //           },
//           options: Options(headers: {
//             "Authorization": "Bearer$token",
//           }));
//       if (response.statusCode == 200) {
//         print('=========posted-=====');
//         return '';
//         //log(response.data['message']);
//         //return response.data['message'];
//       } else {
//         //throw defaultApiError;
//         print('nullllllllll');
//         return '';
//       }
//     } catch (e) {
//       //log(e.toString());
//       //throw handleError(e);
//       print('=============catch error===============');
//       return '';
//     }
//   }
// }
