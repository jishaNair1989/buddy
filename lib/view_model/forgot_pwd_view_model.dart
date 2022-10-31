import 'package:buddy1/extensions/string.dart';
import 'package:buddy1/view/screens/signin.dart';
import 'package:flutter/material.dart';

class ForgotPassdProvider with ChangeNotifier {
  String? email;
  final BuildContext context;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  ForgotPassdProvider(
    this.context,
    this.email,
  ) {
    init();
  }

  init() {
    emailController.text = email ?? '';
  }

  String? checkEmail(String? val) {
    if (val == null) return null;
    return val.trim().isEmail ? null : 'Enter valid Email';
  }

  forgotPassword() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    _hideLoading() {
      Navigator.pop(context);
    }

    _showSuccessAlert() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Email sent'),
              content: const Text(
                  'A email sent to your email, please check your email to reset password'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()));
                    },
                    child: const Text('Ok'))
              ],
            );
          });
    }
  }
}

// class EmailValidation {
//   static String? Function(String? value) emailValid() {
//     return (String? value) {
//       if (value!.isEmpty) {
//         return 'Please enter your email';
//       } else if (!RegExp(
//               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
//               r"([a-zA-Z]+)?$")
//           .hasMatch(value)) {
//         return 'Please enter a valid email';
//       }
//       return null;
//     };
//   }
// }
