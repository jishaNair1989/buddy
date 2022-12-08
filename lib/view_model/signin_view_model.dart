import 'dart:developer';

import 'package:buddy1/extensions/string.dart';
import 'package:buddy1/view_model/userAuth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../model/signin/sign_in_model.dart';
import '../model/signin/sign_in_resp_model.dart';
import '../model/user_model.dart';
import '../services/signin_services.dart';
import '../utils/push_functions.dart';
import '../view/screens/mainscreen.dart';
import '../view/screens/widgets/show_dialogue.dart';
import 'home_view_model.dart';

class SigninViewModel extends ChangeNotifier {
  GlobalKey<FormState> signInFormKey2 = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  final User? user = AuthProvider.currUser;

  // make text obscure for passwords
  bool _isObscure = false;
  get isObscure => _isObscure;
  set isObscure(value) {
    _isObscure = value;
    notifyListeners();
  }

  // to remember login info
  bool _isRemember = true;
  get isRemember => _isRemember;
  set isRemember(value) {
    _isRemember = value;
    notifyListeners();
  }

  Future<void> onSigninButton(context) async {
    if (signInFormKey2.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      final data = SignInModel(
          email: emailController.text, password: passwordController.text);

      SignInResponseModel? signInResponse =
          await SignInService().signInRepo(data, context);
      if (signInResponse == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('No Response'));
        _isLoadingFalse();
        return;
      } else if (signInResponse.verified == true) {
        //print(signInResponse.token);
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Login success ! '));
        await storeLoginData(value: signInResponse);
        await Provider.of<HomeViewModel>(context, listen: false)
            .getHomeData(context)
            .then((_) {
//save User
          //context.read<AuthProvider>().saveUser(user);
          PushFunctions.pushReplace(context, const MainScreen());
        });
        _isLoadingFalse();
        disposes();
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp(signInResponse.message));
        log(signInResponse.message.toString());
        _isLoadingFalse();
      }
    }
  }

  String? emailValidator(String? fieldContent) {
    if (fieldContent == null || fieldContent.isEmpty) {
      return 'Please enter your email';
    } else if (!fieldContent.isEmail) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Please enter your password';
    }

    return null;
  }

  void _isLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  void disposes() {
    signInFormKey2.currentState!.reset();
    emailController.clear();
    passwordController.clear();
    _isObscure = true;
    _isRemember = true;
    isLoading = false;
    notifyListeners();
  }

  FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<void> storeLoginData({required SignInResponseModel value}) async {
    await storage.write(key: 'token', value: value.token!);
  }
}

// forgotPassword(BuildContext context) {
//   final emailController = TextEditingController();
//   PushFunctions.push(
//       context,
//       ForgotPasswordScreen(
//         email: emailController.text.isEmail ? emailController.text : null,
//       ));
// }

String? checkEmail(String? val) {
  if (val == null) return null;
  return val.trim().isEmail ? null : 'Enter valid Email';
}
