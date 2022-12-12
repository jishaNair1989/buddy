import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../view_model/splash_view_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final splashController = Provider.of<SplashViewModel>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 2), () {
        splashController.authCheck(context);
        // PushFunctions.pushReplace(context, const SignInScreen());
      });
    });
    return Scaffold(
      backgroundColor: KColors.kThemeGrey,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/Group 1.png"),
          const Text('Buddy',
              style: TextStyle(
                  fontFamily: 'MainFont',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 4)),
        ],
      )),
    );
  }
}
