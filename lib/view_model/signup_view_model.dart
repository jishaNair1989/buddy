import 'package:flutter/material.dart';
import '../model/signup/sign_up_model.dart';
import '../model/signup/sign_up_resp_model.dart';
import '../services/signup_services.dart';
import '../utils/push_functions.dart';
import '../view/screens/verify.dart';
import '../view/screens/widgets/show_dialogue.dart';

class SignUpViewModel extends ChangeNotifier {
  final signUpKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final genderController = TextEditingController();
  bool isLoading = false;

  // make text obscure for passwords
  bool _isObscure = true;
  get isObscure => _isObscure;
  set isObscure(value) {
    _isObscure = value;
    notifyListeners();
  }

  // signup method
  void onSignupButton(context) async {
    if (signUpKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      final obj = SignUpModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
        gender: genderController.text,
      );
      SignUpResponseModel? signUpResponse =
          await SignUpService().signUpRepo(obj, context);
      if (signUpResponse == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('No Response'));
        _isLoadingFalse();

        return;
//review later
      } else if (signUpResponse.verified == false) {
        PushFunctions.push(context, const MainPage());
        _isLoadingFalse();
      } else if (signUpResponse.verified != false) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp(signUpResponse.message));
        _isLoadingFalse();
        return;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Something went wrong !!!'));
        _isLoadingFalse();
      }
    }
  }

  String? firstNameValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Please enter your first name';
    } else if (fieldContent.length < 4 || fieldContent.length > 15) {
      return 'Name requires 4-15 characters';
    }
    return null;
  }

  String? lastNameValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Please enter your last name';
    } else if (fieldContent.length < 4 || fieldContent.length > 15) {
      return 'Name requires 4-15 characters';
    }
    return null;
  }

  String? emailValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(fieldContent)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Please enter your password';
    }
    if (fieldContent.length < 6) {
      return 'Requires atleast 6 characters';
    }
    return null;
  }

  String? genderValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'enter your gender';
    }
    // if (fieldContent != "male" || fieldContent != "female") {
    //   return 'Invalid gender';
    // }
    return null;
  }

  void _isLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  void disposes() {
    signUpKey.currentState!.reset();
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
    genderController.clear();
    _isObscure = true;
    isLoading = false;
    notifyListeners();
  }
}
