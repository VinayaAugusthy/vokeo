import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vokeo/core/constants/constants.dart';
import 'package:vokeo/presentation/screens/home/widgets/post_container.dart';

import '../../../appllication/profile/profile_data.dart';
import '../../../domain/post/post_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.read<UserProvider>();

    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Padding(
            padding: EdgeInsets.only(left: 13),
            child: Text(
              'VOKEO',
              style: textBold,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.messenger_outline_rounded),
          ),
        ],
      ),
      body: FutureBuilder<List<PostModel>>(
        future: userProvider.fetchPostsFromFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            List<PostModel>? posts = snapshot.data;

            return ListView.builder(
              // scrollDirection: Axis.horizontal,
              itemCount: posts!.length,
              itemBuilder: (context, index) =>
                  postCard(size, posts[index], context),
            );
          }
        },
      ),
    );
  }
}
