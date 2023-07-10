import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vokeo/core/constants/constants.dart';
import 'package:vokeo/domain/authentication/firebase_auth_method.dart';
import 'package:vokeo/presentation/screens/authentication/login.dart';
import 'package:vokeo/presentation/widget/call_textField.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passWordController = TextEditingController();
// TextEditingController confirmPassWordController = TextEditingController();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width / 10),
        child: Center(
          child: SingleChildScrollView(
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
                    labelName: 'Email', controllerName: emailController),
                kheight30,
                callTextField(
                    labelName: 'Password', controllerName: passWordController),
                kheight30,
                // callTextField(
                //     labelName: 'Confirm Password',
                //     controllerName: confirmPassWordController),
                kheight30,
                ElevatedButton(
                  onPressed: () {
                    signUpUserFunction();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => const LoginScreen()),
                    );
                  },
                  child: const Text('SIGNUP'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  signUpUserFunction() async {
    FireBaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
      email: emailController.text,
      password: passWordController.text,
      context: context,
    );
  }

  // validCheck() {
  //   if (userNameController.text.isEmpty && passWordController.text.isEmpty) {
  //     showSnackBar(context, 'The fields cannot be empty');
  //   }
  //   if (userNameController.text.isEmpty) {
  //     showSnackBar(context, 'Username cannot be empty');
  //   } else if (passWordController.text.isEmpty) {
  //     showSnackBar(context, 'Password cannot be empty');
  //   } else {
  //     signUpUserFunction();
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (ctx) => const LoginScreen()),
  //     );
  //   }
  // }
}
