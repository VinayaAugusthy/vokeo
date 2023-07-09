import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vokeo/presentation/widget/error_snackbar.dart';

class FireBaseAuthMethods {
  final FirebaseAuth _auth;

  FireBaseAuthMethods(this._auth);
//Email signup
  signUpWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

//email  verification
  sendEmailVerification(
    BuildContext context,
  ) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification semt!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
