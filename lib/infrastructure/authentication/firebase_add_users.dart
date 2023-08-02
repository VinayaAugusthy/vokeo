// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vokeo/presentation/screens/base/base_screen.dart';

import '../../appllication/user/user.dart';
import '../../domain/user/user_model.dart';

saveUserData(UserModel user, BuildContext context) async {
  // Access the UserController using Provider.of or context.watch
  final userRepo = Provider.of<UserController>(context, listen: false);

  await userRepo.createUser(user);

  // Replace Get.offAll with Navigator method
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (_) => const BaseScreen()),
    (route) => false,
  );
}
