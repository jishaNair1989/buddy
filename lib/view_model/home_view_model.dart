//import 'package:buddy1/model/postveiw/all_post_model.dart';
import 'dart:developer';

import 'package:buddy1/model/postveiw/all_posts_model.dart';
import 'package:buddy1/services/get_post_service.dart';
import 'package:buddy1/utils/push_functions.dart';
import 'package:buddy1/view/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeView extends ChangeNotifier {
  void onLogoutButton(context) async {
    // await Future.delayed(const Duration(seconds: 1), () {
    const FlutterSecureStorage storage = FlutterSecureStorage();

    await storage.write(key: 'login', value: 'false');
    PushFunctions.pushAndRemoveUntil(context, const SignInScreen());
    //}
// );
  }

  //List<PostData> homeDatas = [];
  List<AllPostsModel> homeDatas = [];
  bool isLoading = false;
  Future<void> getHomeData(context) async {
    isLoading = true;
    notifyListeners();
    //Slots? response = await GetPostsService().getPostRepo(context);
    List<AllPostsModel>? response =
        await GetPostsService().getPostRepo(context);
    if (response != null) {
      log('=======================');
      //homeDatas.addAll(response.listOfSlots ?? []);
      homeDatas.addAll(response);
      log(homeDatas.toString());
    } else {
      log('response is null');
    }
    isLoading = false;
    notifyListeners();
    //log(response.toString());
  }
}
