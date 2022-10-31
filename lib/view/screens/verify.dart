import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/push_functions.dart';
import '../../view_model/signin_view_model.dart';
import 'home.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signinController = Provider.of<SigninViewModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 0, backgroundColor: KColors.kThemeGrey),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
          child: Text('Check mail to Validate Account'),
        ),
            ElevatedButton(onPressed: (){
              // signinController
              //     .signInFormKey2.currentState!
              //     .validate();
              PushFunctions.pushReplace(context, const MainProfile());
            }, child: const Text('Go to Home'))
          ],
        ),
      ),
    );
  }
}
