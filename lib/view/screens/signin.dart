import 'package:buddy1/view/screens/signup.dart';
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
import '../../view_model/signin_view_model.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signinController = Provider.of<SigninViewModel>(context);
    return Form(
        key: signinController.signInFormKey2,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Scaffold(
            backgroundColor: KColors.kThemeGrey,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 8.5),
                      const SingleColorTitle(
                        text: 'Sign in to',
                        color: KColors.kBlackColor,
                      ),
                      KSizedBox.kHeigh_5,
                      const SingleColorTitle(
                        text: 'BUDDY',
                        color: KColors.kThemePink,
                      ),
                      KSizedBox.kHeigh_15,
                      Consumer<SigninViewModel>(
                        builder: (context, value, _) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: KColors.kWhiteColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 30, bottom: 25),
                            child: Column(
                              children: [
                                TextFieldWidget(
                                  hintText: 'Email ID',
                                  controller: signinController.emailController,
                                  validator: signinController.emailValidator,
                                  inputType: TextInputType.emailAddress,
                                ),
                                KSizedBox.kHeigh_20,
                                PasswordTextFieldWidget(
                                  hintText: 'Password',
                                  icon: Icons.visibility,
                                  controller:
                                      signinController.passwordController,
                                  validator: signinController.passwordValidator,
                                  signPro: Provider.of<SigninViewModel>(context,
                                      listen: false),
                                ),
                                Row(children: [
                                  Checkbox(
                                    fillColor: MaterialStateProperty.all(
                                        KColors.kThemeGrey),
                                    value: signinController.isRemember,
                                    onChanged: (value) {
                                      signinController.isRemember =
                                          !signinController.isRemember;
                                    },
                                  ),
                                  const Text('Remember Me',
                                      style: TextStyle(color: Colors.black54)),
                                  const Spacer(),
                                  TextButtonWidget(
                                    buttonText: 'Forgot Password ?',
                                    color: Colors.black54,
                                    onTap: () {
                                      // provider.forgotPassword(context),
                                    },
                                  ),
                                ]),
                                KSizedBox.kHeigh_20,
                                value.isLoading
                                    ? const CircularProgressIndicator()
                                    : ButtonWidget(
                                        text: 'Sign in',
                                        onTap: () {
                                          signinController
                                              .signInFormKey2.currentState!
                                              .validate();
                                          signinController
                                              .onSigninButton(context);
                                         
                                          // signinController.disposes();
                                        },
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
           
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: TextButtonWidget(
              text: "Don't have an account?",
              buttonText: 'Sign up',
              onTap: () {
                PushFunctions.pushReplace(context, const SignupScreen());
                signinController.disposes();
              },
            ),
            resizeToAvoidBottomInset: false));
  }
}
