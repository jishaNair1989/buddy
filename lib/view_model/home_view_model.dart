import 'dart:developer';

import 'package:buddy1/model/postveiw/all_post_model.dart';
import 'package:buddy1/services/get_post_service.dart';
import 'package:buddy1/utils/push_functions.dart';
import 'package:buddy1/view/screens/signin.dart';
import 'package:flutter/material.dart';

class HomeView extends ChangeNotifier {
  void onLogoutButton(context) async {
    await Future.delayed(const Duration(seconds: 1), () {
      PushFunctions.pushAndRemoveUntil(context, const SignInScreen());
    });
  }

  List<PostData> homeDatas = [];
  bool isLoading = false;
  Future<void> getHomeData(context) async {
    isLoading = true;
    notifyListeners();
    Slots? response = await GetPostsService().getPostRepo(context);
    if (response != null) {
      homeDatas.addAll(response.listOfSlots ?? []);
    }
    isLoading = false;
    notifyListeners();
    log(response.toString());
  }
}
