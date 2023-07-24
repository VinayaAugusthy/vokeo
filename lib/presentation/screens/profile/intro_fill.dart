// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vokeo/core/constants/constants.dart';
import 'package:vokeo/presentation/widget/call_textField.dart';

class IntroProfile extends StatelessWidget {
  IntroProfile({super.key});

  String? imagepath;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController userNameController = TextEditingController();
    TextEditingController bioController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    double screenWidth = MediaQuery.of(context).size.width;
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
                            choosePic();
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
                        onPressed: () {},
                        child: const Text(
                          'Cancel',
                          style: textBold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
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

  choosePic() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {}
  }
}
