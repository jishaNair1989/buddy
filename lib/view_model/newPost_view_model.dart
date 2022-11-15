// import 'package:buddy1/tmp/feeds_view_model.dart';
// import 'package:buddy1/view_model/userAuth_view_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';

// import '../model/postveiw/newPost_model.dart';
// import '../model/user_model.dart';
// import '../services/new_post_service.dart';
// import '../utils/util.dart';

// class NewPostViewModel extends ChangeNotifier {
//   bool isLoading = false;

//   final captionController = TextEditingController();
//   void post(BuildContext context, String imagePath) {
//     _showLoading();
//     User user = AuthProvider.currUser??User();
//     final post = NewPostModel(
//       userId: user.id??'',
//       file: imagePath,
//       comments: captionController.text,
//     );
//     NewPostService().postImage(post:post).whenComplete(_hideLoading).then((value) {
//       Util.context.read<FeedsProvider>().refresh();
//     }).onError((error, _) => Util.showSnackbar(error.toString()));
//     // context.pushRemoveUntil(const HomeScreen());
//     captionController.clear();
//   }

//   void _showLoading() {
//     isLoading = true;
//     notifyListeners();
//   }

//   void _hideLoading() {
//     isLoading = false;
//     notifyListeners();
//   }
// }
