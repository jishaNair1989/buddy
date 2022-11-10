// import 'package:flutter/material.dart';

// import '../model/postveiw/all_post_model.dart';
// import 'auth_view_model.dart';

// class PostViewModel extends ChangeNotifier {
//   bool isLoading = false;

//    final captionController = TextEditingController();
//   post(BuildContext context, String imagePath) {
//     _showLoading();
//     User user = AuthProvider.currUser!;
//     final post = ImagePostModel(
//       userId: user.id,
//       file: imagePath,
//       caption: captionController.text,
//     );
//     PostService().postImage(post).whenComplete(_hideLoading).then((value) {
//       Util.context.read<FeedsProvider>().refresh();
//     }).onError((error, _) => Util.showSnackbar(error.toString()));
//     context.pushRemoveUntil(const MainSCreen());
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
