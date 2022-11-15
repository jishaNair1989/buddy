import 'package:buddy1/utils/push_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../view/screens/bottom_screens/home_screen.dart';
import '../view/screens/signin.dart';

class SplashViewModel extends ChangeNotifier {
  String? data = '';
  final storage = const FlutterSecureStorage();

  authCheck(context) async {
    await Future.delayed(const Duration(seconds: 3));
    storage.read(key: "login").then((value) {
      data = value;

      if (data == "true") {
        PushFunctions.pushReplace(context, const HomeScreen());
      } else {
        PushFunctions.pushReplace(context, const SignInScreen());
      }
    });
  }
}
