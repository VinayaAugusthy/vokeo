import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vokeo/presentation/screens/base/base_screen.dart';

import '../../domain/post/post_model.dart';

void addPostToFirestore(String username, String caption, String imageUrl,
    BuildContext context) async {
  PostModel newPost = PostModel(
      username: username,
      caption: caption,
      imagePath: imageUrl,
      timestamp: DateTime.now(),
      likes: [],
      comments: []);

  FirebaseFirestore.instance
      .collection('posts')
      .add(newPost.toJson())
      .then((value) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const BaseScreen(),
        ),
        (route) => false);
  }).onError((error, stackTrace) {});
}
