import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../domain/post/post_model.dart';
import '../../domain/user/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  fetchUserDetailsFromFireStore(String email) async {
    try {
      DocumentSnapshot userSnapshot =
          await firestore.collection('users').doc(email).get();

      if (userSnapshot.exists) {
        _currentUser = UserModel(
            email: email,
            fullName: userSnapshot["fullName"],
            userName: userSnapshot["username"],
            imagePath: userSnapshot["profile pic"]);

        notifyListeners();
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<List<PostModel>> fetchPostsFromFirebase() async {
    List<PostModel> posts = [];

    try {
      QuerySnapshot postSnapshot = await firestore.collection('posts').get();
      for (var postDoc in postSnapshot.docs) {
        PostModel post = PostModel(
            postId: postDoc.id,
            username: postDoc["username"],
            imagePath: postDoc["post pic"],
            caption: postDoc["caption"],
            timestamp: postDoc["timestamp"].toDate(),
            likes: List<String>.from(postDoc["likes"]),
            comments: []);
        posts.add(post);
      }
      // ignore: empty_catches
    } catch (e) {}
    return posts;
  }

  getProfilePictureUrl(String username) async {
    String imageUrl;
    QuerySnapshot userSnapShot = await firestore
        .collection('users')
        .where('username', isEqualTo: username)
        .get();
    if (userSnapShot.docs.isNotEmpty) {
      imageUrl = userSnapShot.docs[0]["image path"];
    } else {
      imageUrl = '';
    }
    return imageUrl;
  }
}
