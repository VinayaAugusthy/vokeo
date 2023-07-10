import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vokeo/core/constants/constants.dart';
import 'package:vokeo/domain/authentication/firebase_auth_method.dart';
import 'package:vokeo/presentation/screens/base_screen.dart';
import 'package:vokeo/presentation/screens/signup.dart';
import 'package:vokeo/presentation/widget/call_textField.dart';
import '../widget/error_snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController userNameController = TextEditingController();
TextEditingController passWordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 0,
          bottom: 0,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth / 8),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 250,
                    child: Image.asset(
                      'assets/images/login.png',
                    ),
                  ),
                  callTextField(
                      labelName: 'Username',
                      controllerName: userNameController),
                  kheight20,
                  callTextField(
                      labelName: 'Password',
                      controllerName: passWordController),
                  kheight20,
                  ElevatedButton(
                    onPressed: () {
                      validCheck();
                    },
                    child: const Text(
                      'LOGIN',
                      style: textBold,
                    ),
                  ),
                  kheight20,
                  const Text(
                    'OR',
                    style: textBold,
                  ),
                  kheight20,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/images/google.png'),
                      ),
                      kWidth10,
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/images/fb.png'),
                      )
                    ],
                  ),
                  kheight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Do not have an account? ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (ctx) => const SignUp()),
                          );
                        },
                        child: const Text(
                          ' Signup',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  loginUser() {
    FireBaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
      email: emailController.text,
      password: passWordController.text,
      context: context,
    );
  }

  validCheck() {
    if (userNameController.text.isEmpty && passWordController.text.isEmpty) {
      showSnackBar(context, 'The fields cannot be empty');
    }
    if (userNameController.text.isEmpty) {
      showSnackBar(context, 'Username cannot be empty');
    } else if (passWordController.text.isEmpty) {
      showSnackBar(context, 'Password cannot be empty');
    } else {
      loginUser();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => const BaseScreen()),
      );
    }
  }

  // errorCheck() {
  //   if ((userNameController.text.isNotEmpty &&
  //           passWordController.text.isNotEmpty) ||
  //       userNameController.text.isNotEmpty ||
  //       passWordController.text.isNotEmpty) {
  //     loginUser();
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (ctx) => const BaseScreen()),
  //     );
  //   }
  // }
}
