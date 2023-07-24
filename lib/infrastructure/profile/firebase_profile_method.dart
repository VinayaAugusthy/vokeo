import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vokeo/presentation/widget/error_snackbar.dart';

class FireBaseProfileMethod {
  final CollectionReference profileCollection =
      FirebaseFirestore.instance.collection('profiles');
  saveProfileData(
      {required String fullName,
      required String username,
      String? bio,
      required String imagePath,
      BuildContext? context}) async {
    try {
      await profileCollection.add({
        'fullName': fullName,
        'username': username,
        'bio': bio,
        'imagePath': imagePath
      });
    } on FirebaseException catch (e) {
      showSnackBar(context!, e.message!);
    }
  }
}
