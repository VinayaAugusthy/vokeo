// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vokeo/core/constants/constants.dart';
import 'package:vokeo/domain/user/user_model.dart';
import 'package:vokeo/infrastructure/authentication/firebase_auth_method.dart';
import 'package:vokeo/infrastructure/authentication/firebase_add_image.dart';
import 'package:vokeo/infrastructure/authentication/firebase_add_users.dart';
import 'package:vokeo/presentation/screens/authentication/signup.dart';
import 'package:vokeo/presentation/widget/call_textField.dart';

class IntroProfile extends StatefulWidget {
  const IntroProfile({super.key});

  @override
  State<IntroProfile> createState() => _IntroProfileState();
}

class _IntroProfileState extends State<IntroProfile> {
  String? imagepath;

  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController userNameController = TextEditingController();
    TextEditingController bioController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final signedUser = context.read<FireBaseAuthMethods>().currentUser;
    double screenWidth = MediaQuery.of(context).size.width;
    // saveProfileData(BuildContext context) async {
    //   final user = context.read<UserModel>();
    //   // final dpSetter = context.read<ImageProviderModel>();
    //   // final name = nameController.text;
    //   // final username = userNameController.text;
    //   UserModel(
    //       imagePath: user.imagePath,
    //       fullName: user.fullName,
    //       userName: user.userName,
    //       bio: user.bio);
    // }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth / 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        backgroundImage: imagepath == null
                            ? const AssetImage('assets/images/dp.jpg')
                                as ImageProvider
                            : FileImage(File(imagepath!)),
                        radius: 75,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 20,
                        // left: 0,
                        child: InkWell(
                          child: const Icon(
                            Icons.add_a_photo_sharp,
                            size: 30,
                          ),
                          onTap: () {
                            choosePic(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  kheight30,
                  callTextField(
                    labelName: 'Full Name',
                    controllerName: nameController,
                    validation: (value) {
                      if (nameController.text.isEmpty) {
                        return 'name is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  kheight30,
                  callTextField(
                    labelName: 'Username',
                    controllerName: userNameController,
                    validation: (value) {
                      if (userNameController.text.trim().isEmpty) {
                        return 'Username is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  kheight30,
                  callTextField(
                    labelName: 'Bio',
                    controllerName: bioController,
                    validation: (value) {
                      return null;
                    },
                  ),
                  kheight30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                            (route) => false,
                          );
                        },
                        child: const Text(
                          'Cancel',
                          style: textBold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final user = UserModel(
                                email: signedUser!.email!,
                                imagePath: imageUrl != null ? imageUrl! : dp,
                                fullName: nameController.text.trim(),
                                userName: userNameController.text.trim(),
                                bio: bioController.text.isNotEmpty
                                    ? bioController.text.trim()
                                    : '');
                            // userController.createUser(user);
                            saveUserData(user, context);
                          }
                        },
                        child: const Text(
                          'Save',
                          style: textBold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  choosePic(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imagepath = pickedFile.path;
      });
      imageUrl = await addProfileImge(pickedFile);
    }
  }
}
