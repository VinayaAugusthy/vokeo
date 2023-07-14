import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vokeo/presentation/screens/authentication/login.dart';
import 'package:vokeo/presentation/screens/home/widgets/post_container.dart';

import '../../../core/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
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
                      onPressed: () async {
                        GoogleSignIn().disconnect();
                        await FirebaseAuth.instance.signOut().then((value) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                              (route) => false);
                        });
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
