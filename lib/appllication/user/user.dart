import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../domain/profile/into_profile.dart';

class UserController extends ChangeNotifier {
  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db.collection("users").add(user.toJson());
    notifyListeners();
  }
}
