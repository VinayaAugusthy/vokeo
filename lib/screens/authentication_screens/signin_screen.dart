import 'package:flutter/material.dart';
import 'package:vokeo/screens/authentication_screens/reset_password.dart';
import 'package:vokeo/screens/authentication_screens/signup_screen.dart';

import '../../resourses/auth_methods.dart';
import '../../utils/spacing.dart';
import '../../utils/utils.dart';
import '../bottom_nav/bottom_nav_screen.dart';
import '../widgets/text_field.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(200, 195, 144, 200),
      resizeToAvoidBottomInset: false,
      body: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(color: Colors.white),
            )
          : Column(
              children: [
                getVerticalSpace(50),
                Row(
                  children: [
                    getHorizontalSpace(100),
                    const Text(
                      'VOKEO',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 20, 60),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          textFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email_rounded,
                                color: Colors.white,
                              ),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          getVerticalSpace(20),
                          textFormField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Colors.white,
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              isObscure: true),
                          getVerticalSpace(20),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ResetPassword(),
                                    ),
                                  ),
                                  child: const Text(
                                    'Forgot password ? ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          getVerticalSpace(20),
                          SizedBox(
                            height: 40,
                            width: 300,
                            child: isLoading != true
                                ? ElevatedButton.icon(
                                    onPressed: signinUser,
                                    icon: const Icon(Icons.check),
                                    label: const Text('Login'),
                                  )
                                : const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                          getVerticalSpace(20),
                          const Text(
                            'OR',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          getVerticalSpace(20),
                          SizedBox(
                            height: 40,
                            width: 300,
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                bool result =
                                    await AuthMethods().signInWithGoogle();

                                if (result) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => BottomNavScreen(),
                                    ),
                                  );
                                } else {
                                  // ignore: use_build_context_synchronously
                                  showSnackbar(context,
                                      "Error Occured in google signin");
                                }
                              },
                              icon: const Image(
                                image: AssetImage('assets/google.png'),
                                height: 20,
                                width: 20,
                              ),
                              label: const Text('Signin with Google'),
                            ),
                          ),
                          getVerticalSpace(60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account ? "),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignupScreen(),
                                  ),
                                ),
                                child: const Text(
                                  "Signup",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  signinUser() async {
    setState(() {
      isLoading = true;
    });

    String res = await AuthMethods().signinuser(
        email: emailController.text, password: passwordController.text);

    if (res == "Success") {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BottomNavScreen(),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      showSnackbar(context, res);
    }
    setState(() {
      isLoading = false;
    });
  }
}
