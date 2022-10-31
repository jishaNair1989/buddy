import 'package:buddy1/model/postveiw/all_post_model.dart';
import 'package:buddy1/services/get_post_service.dart';
import 'package:buddy1/utils/push_functions.dart';
import 'package:buddy1/view/screens/signin.dart';
import 'package:buddy1/view/screens/widgets/show_dialogue.dart';
import 'package:flutter/material.dart';

class HomeView extends ChangeNotifier {
  void onLogoutButton(context) async {
    await Future.delayed(const Duration(seconds: 1), () {
      PushFunctions.pushAndRemoveUntil(context, const SignInScreen());
    });
  }

  List<Post> allPost = [];
  bool isLoading = false;
  void onSigninButton(context) async {
    isLoading = true;
    notifyListeners();

    Post? postResponse = await GetPostsService().getPostRepo(context);
    if (postResponse == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(ShowDialogs.popUp('No Response'));
      _isLoadingFalse();
      return;
    } else if (postResponse.user != null) {
      allPost.add(postResponse);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(ShowDialogs.popUp(postResponse.message ?? ''));
      print(postResponse.message);
      _isLoadingFalse();
    }
  }

  _isLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }
}
