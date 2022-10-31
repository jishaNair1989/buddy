import 'package:buddy1/view/screens/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/forgot_pwd_view_model.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key, this.email}) : super(key: key);
  final String? email;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgotPassdProvider(context, email),
      child: Builder(builder: (context) {
        final provider = context.read<ForgotPassdProvider>();
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black),
              title: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.black),
              )),
          body: SafeArea(
            child: Form(
                key: provider.formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldWidget(
                        controller: provider.emailController,
                        hintText: 'Email',
                        inputType: TextInputType.emailAddress,
                        validator: provider.checkEmail,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: provider.forgotPassword,
                            child: const Text('Forgot password')),
                      )
                    ],
                  ),
                )),
          ),
        );
      }),
    );
  }
}
