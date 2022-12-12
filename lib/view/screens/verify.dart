import 'package:buddy1/view/screens/signin.dart';
import 'package:buddy1/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/push_functions.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final signinController = Provider.of<SigninViewModel>(context);
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
            ElevatedButton(
                onPressed: () {
                  // signinController
                  //     .signInFormKey2.currentState!
                  //     .validate();
                  Provider.of<HomeViewModel>(context, listen: false)
                      .getHomeData(context)
                      .then((_) {
                    PushFunctions.pushReplace(context, const SignInScreen());
                  });
                },
                child: const Text('Validate'))
          ],
        ),
      ),
    );
  }
}
