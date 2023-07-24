// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vokeo/core/constants/constants.dart';
import 'package:vokeo/infrastructure/authentication/firebase_auth_method.dart';
import 'package:vokeo/presentation/widget/call_textField.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width / 10),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 250,
                    child: Image.asset(
                      'assets/images/signup.png',
                    ),
                  ),
                  callTextField(
                    labelName: 'Email',
                    controllerName: emailController,
                    validation: (value) {
                      if (emailController.text.isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(
                              r'^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,7}$')
                          .hasMatch(value!)) {
                        return 'Please enter a valid email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  kheight30,
                  callTextField(
                    labelName: 'Password',
                    controllerName: passWordController,
                    obscureText: true,
                    validation: (value) {
                      if (passWordController.text.isEmpty) {
                        return 'Password is required';
                      } else if (emailController.text.length < 6) {
                        return 'Password must be atleast 6 character long';
                      } else {
                        return null;
                      }
                    },
                  ),
                  kheight30,
                  kheight30,
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        signUpUserFunction(context);
                      }
                    },
                    child: const Text('SIGNUP'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  signUpUserFunction(BuildContext context) async {
    context.read<FireBaseAuthMethods>().signUpWithEmail(
          email: emailController.text,
          password: passWordController.text,
          context: context,
        );
  }
}
