import 'package:buddy1/utils/push_functions.dart';
import 'package:buddy1/view/screens/mainscreen.dart';
import 'package:buddy1/view/screens/signin.dart';
import 'package:buddy1/view_model/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class SplashViewModel extends ChangeNotifier {
  String? data = '';
  final storage = const FlutterSecureStorage();

  Future<void> authCheck(context) async {
    await Future.delayed(const Duration(seconds: 3));
    final String tokn = await storage.read(key: "token") ?? '';
    if (tokn.isNotEmpty) {
      Provider.of<HomeViewModel>(context, listen: false)
          .getHomeData(context)
          .then((_) {
        PushFunctions.pushReplace(context, const MainScreen());
      });
    } else {
      PushFunctions.pushReplace(context, const SignInScreen());
    }
  }
}
