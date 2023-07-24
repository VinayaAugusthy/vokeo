import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vokeo/presentation/screens/home/widgets/post_container.dart';
import '../../../core/constants/colors.dart';
import '../../../infrastructure/authentication/firebase_auth_method.dart';
import '../authentication/login.dart';

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
                      onPressed: () async {
                        // GoogleSignIn().disconnect();
                        await context
                            .read<FireBaseAuthMethods>()
                            .signOut(context)
                            .then((value) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                              (route) => false);
                        });
                        // context.read<FireBaseAuthMethods>().signOut(context);
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
