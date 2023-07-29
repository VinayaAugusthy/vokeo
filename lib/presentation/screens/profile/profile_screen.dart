import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vokeo/presentation/screens/profile/widgets/profile_grid.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../infrastructure/profile/profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final user = context.read<FirebaseAuthMethods>().currentUser;
    Size size = MediaQuery.sizeOf(context);
    return FutureBuilder<DocumentSnapshot?>(
        future: getUserDataByEmail(FirebaseAuth.instance.currentUser!.email!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData && snapshot.data != null) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return DefaultTabController(
              length: 2,
              child: Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: size.width / 16,
                      top: size.width / 16,
                      right: size.width / 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kheight20,
                        Text(userData['username']),
                        kheight20,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 34,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  NetworkImage(userData["profile pic"]),
                            ),
                            kWidth30,
                            const Column(
                              children: [
                                Text(
                                  '215',
                                  style: textBold,
                                ),
                                Text(
                                  'Followers',
                                  style: textBold,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            const Column(
                              children: [
                                Text(
                                  '1000',
                                  style: textBold,
                                ),
                                Text(
                                  'Following',
                                  style: textBold,
                                ),
                              ],
                            ),
                          ],
                        ),
                        kheight20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                'Edit Profile',
                                style: textBold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.settings,
                                color: appColor,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const TabBar(
                                tabs: [
                                  Tab(
                                    icon: Icon(
                                      Icons.image,
                                      color: appColor,
                                    ),
                                  ),
                                  Tab(
                                    icon: Icon(
                                      Icons.bookmark,
                                      color: appColor,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    profileGrid(),
                                    profileGrid(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Text('data');
          }
        });
  }
}
