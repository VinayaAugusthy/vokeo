import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:vokeo/presentation/screens/profile/intro_fill.dart';
import 'package:vokeo/presentation/widget/error_snackbar.dart';
import '../../presentation/screens/authentication/login.dart';
import '../../presentation/screens/base/base_screen.dart';

class FireBaseAuthMethods {
  final FirebaseAuth _auth;

  FireBaseAuthMethods(this._auth);
  User? get currentUser => _auth.currentUser;
//State maintaince
  Stream<User?> get authState => _auth.authStateChanges();

//Email signup
  signUpWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const IntroProfile(),
          ),
          (route) => false,
        );
      });
      // ignore: use_build_context_synchronously
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

//Emaillogin
  loginWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const BaseScreen(),
            ),
            (route) => false);
      });
      // if (!_auth.currentUser!.emailVerified) {
      //   await sendEmailVerification(context);
      // }
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

  signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const BaseScreen(),
          ),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  signOut(BuildContext context) async {
    try {
      await _auth.signOut();
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  logout(BuildContext context) async {
    await context.read<FireBaseAuthMethods>().signOut(context).then(
      (value) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
            (route) => false);
      },
    );
  }
}
