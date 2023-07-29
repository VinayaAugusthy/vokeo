import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../infrastructure/posts/post.dart';
import '../../infrastructure/posts/upload_post.dart';
import '../../infrastructure/profile/profile.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String? imagePath;
  String? imageUrl;
  final TextEditingController _captionController = TextEditingController();

  Future<void> selectImage(String clicked, String username) async {
    final XFile? imagePicked;
    if (clicked == 'gallery') {
      imagePicked = await ImagePicker().pickImage(source: ImageSource.gallery);
    } else {
      imagePicked = await ImagePicker().pickImage(source: ImageSource.camera);
    }
    if (imagePicked != null) {
      setState(() {
        imagePath = imagePicked!.path;
      });

      imageUrl = await addPostImage(imagePicked, username);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return FutureBuilder(
      future: getUserDataByEmail(FirebaseAuth.instance.currentUser!.email!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("Error ${snapshot.error}");
        } else if (snapshot.hasData && snapshot.data != null) {
          final userData = snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Post'),
              centerTitle: true,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(size.width / 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * .7,
                        height: size.width * .8,
                        decoration: imagePath != null
                            ? BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(File(imagePath!)),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              )
                            : BoxDecoration(
                                color: const Color.fromARGB(255, 227, 164, 164),
                                borderRadius: BorderRadius.circular(10),
                              ),
                      ),
                      SizedBox(
                        height: size.width * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              selectImage('camera', userData["username"]);
                            },
                            child: const CircleAvatar(
                              // backgroundColor: kRedColor,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: 35,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width / 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              selectImage('gallery', userData["username"]);
                            },
                            child: const CircleAvatar(
                              // backgroundColor: kRedColor,
                              child: Icon(
                                Icons.photo_library_outlined,
                                size: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.width / 16,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: size.width * .15,
                        child: TextField(
                          controller: _captionController,
                          maxLines: 100,
                          decoration: InputDecoration(
                              filled: true,
                              hintText: 'Caption',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      SizedBox(
                        height: size.width / 16,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            addPostToFirestore(userData["username"],
                                _captionController.text, imageUrl!, context);
                          },
                          child: const Text(
                            'Post',
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Text('data');
        }
      },
    );
  }
}
