import 'package:buddy1/view/screens/signin.dart';
import 'package:buddy1/view/screens/widgets/button_wid.dart';
import 'package:buddy1/view/screens/widgets/password_textfld.dart';
import 'package:buddy1/view/screens/widgets/single_color_title.dart';
import 'package:buddy1/view/screens/widgets/textfield.dart';
import 'package:buddy1/view/screens/widgets/txt_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/push_functions.dart';
import '../../utils/size.dart';
import '../../view_model/signup_view_model.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final signupController = Provider.of<SignUpViewModel>(context);


    return Scaffold(
      backgroundColor: KColors.kThemeGrey,
      body: SafeArea(
        child: Form(
          key: signupController.signUpKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 18.0),
                  const SingleColorTitle(
                    text: 'Sign up to',
                    color: KColors.kWhiteColor,
                  ),
                  KSizedBox.kHeigh_5,
                  const SingleColorTitle(
                    text: 'BUDDY',
                    color: KColors.kThemeYellow,
                  ),
                  KSizedBox.kHeigh_15,
                  Consumer<SignUpViewModel>(
                    builder: (context, value, child) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: KColors.kWhiteColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 30, bottom: 20),
                        child: Column(
                          children: [
                            TextFieldWidget(
                              hintText: 'Firstname',
                              controller: signupController.firstNameController,
                              validator: signupController.firstNameValidator, inputType: TextInputType.text,
                            ),
                            KSizedBox.kHeigh_20,
                            TextFieldWidget(
                              hintText: 'Lastname',
                              controller: signupController.lastNameController,
                              validator: signupController.lastNameValidator,inputType: TextInputType.text
                            ),
                            KSizedBox.kHeigh_20,
                            TextFieldWidget(
                              hintText: 'Email ID',
                              controller: signupController.emailController,
                              validator: signupController.emailValidator,inputType: TextInputType.emailAddress
                            ),
                            KSizedBox.kHeigh_20,
                            PasswordTextFieldWidget(
                              hintText: 'Password',
                              icon: Icons.visibility,
                              controller: signupController.passwordController,
                              validator: signupController.passwordValidator,
                              signPro: Provider.of<SignUpViewModel>(context,
                                  listen: false),
                            ),
                            KSizedBox.kHeigh_20,
                            TextFieldWidget(
                              hintText: 'Gender',
                              controller:
                              signupController.genderController,
                              validator:
                              signupController.genderValidator,inputType: TextInputType.text

                            ),
                            KSizedBox.kHeigh_20,
                            value.isLoading
                                ? const CircularProgressIndicator()
                                :
                            ButtonWidget(
                              text: 'Sign up',
                              onTap: () {
                                signupController.onSignupButton(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // KSizedBox.kHeigh_20,
                  // const OrWidget(),
                  // KSizedBox.kHeigh_10,
                  // const SignUpWithGoogle(),
                  // KSizedBox.kHeigh_30,
                  TextButtonWidget(
                    text: "Already have an account?",
                    buttonText: 'Sign in',
                    onTap: () {
                      PushFunctions.pushReplace(context, const SignInScreen());
                      signupController.disposes();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
