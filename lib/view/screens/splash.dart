import 'dart:async';

import 'package:buddy1/view/screens/signin.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/push_functions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 2), () {
        PushFunctions.pushReplace(context, const SignInScreen());
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
