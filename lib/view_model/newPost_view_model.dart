import 'package:buddy1/services/newpost_service.dart';
import 'package:buddy1/utils/push_functions.dart';
import 'package:buddy1/view_model/userAuth_view_model.dart';
import 'package:flutter/material.dart';

import '../model/postveiw/newPost_model.dart';
import '../model/user_model.dart';
import '../view/screens/bottom_screens/home_screen.dart';

class NewpostViewModel with ChangeNotifier {
  bool isLoading = false;

  final captionController = TextEditingController();

  onPost(BuildContext context, String imagePath) {
    _showLoading();
    User user = AuthProvider.currUser!;
    final post = NewPostModel(
      userId: user.id,
      file: imagePath,
      comments: captionController.text,
    );
    NewPost().postImage(post).whenComplete(_hideLoading).then((value) {
      //Util.context.read<FeedsProvider>().refresh();
      print('=========posted-=====');
    });
//.onError((error, _) => Util.showSnackbar(error.toString()));
    PushFunctions.pushAndRemoveUntil(context, const HomeScreen());
    captionController.clear();
  }

  void _showLoading() {
    isLoading = true;
    notifyListeners();
  }

  void _hideLoading() {
    isLoading = false;
    notifyListeners();
  }
}
