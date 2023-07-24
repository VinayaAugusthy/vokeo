import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vokeo/presentation/screens/home/widgets/post_container.dart';
import '../../../core/constants/colors.dart';
import '../../../infrastructure/authentication/firebase_auth_method.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: size.width / 20,
            top: size.width / 14,
            right: size.width / 20,
          ),
          child: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'VOKEO',
                    style: TextStyle(fontSize: 24, color: appColor),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.messenger_outline_rounded)),
                  IconButton(
                      onPressed: () {
                        // GoogleSignIn().disconnect();
                        // await FirebaseAuth.instance.signOut().then((value) {
                        //   Navigator.of(context).pushAndRemoveUntil(
                        //       MaterialPageRoute(
                        //         builder: (context) => const LoginScreen(),
                        //       ),
                        //       (route) => false);
                        // });
                        FireBaseAuthMethods(FirebaseAuth.instance)
                            .signOut(context);
                      },
                      icon: const Icon(Icons.logout))
                ],
              ),
              Expanded(
                child: ListView(
                  children: List.generate(8, (index) => postContainer()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
