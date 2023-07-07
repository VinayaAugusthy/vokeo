import 'package:flutter/material.dart';
import 'package:vokeo/core/constants/constants.dart';
import 'package:vokeo/presentation/screens/otp_screen.dart';
import 'package:vokeo/presentation/widget/call_textField.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController userNameController = TextEditingController();
TextEditingController passWordController = TextEditingController();
TextEditingController confirmPassWordController = TextEditingController();

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
                    labelName: 'Username', controllerName: userNameController),
                kheight30,
                callTextField(
                    labelName: 'Password', controllerName: passWordController),
                kheight30,
                callTextField(
                    labelName: 'Confirm Password',
                    controllerName: confirmPassWordController),
                kheight30,
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (ctx) => OtpScreen()),
                      );
                    },
                    child: Text('SIGNUP'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
