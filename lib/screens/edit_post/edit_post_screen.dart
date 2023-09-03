// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/user.dart';
import '../../providers/edit_posts/edit_post_provider.dart';
import '../../providers/user_provider.dart';
import '../../resourses/firestore_methods.dart';
import '../../utils/spacing.dart';
import '../../utils/utils.dart';
import '../bottom_nav/bottom_nav_screen.dart';

class EditPostScreen extends StatelessWidget {
  final Map<String, dynamic> snap;

  const EditPostScreen({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController descriptionController = TextEditingController();

    final editPostProvider = Provider.of<EditPostProvider>(context);
    final isLoading = editPostProvider.isLoading;

    final User? user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              editPostProvider.setLoading(true); // Set loading to true
              updateCaption(
                snap['postId'].toString(),
                descriptionController.text,
                context,
              );
            },
            child: const Text(
              'Update Caption',
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          isLoading ? const LinearProgressIndicator() : Container(),
          getVerticalSpace(100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user!.photoUrl),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  controller: descriptionController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Write a caption",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 45,
                width: 45,
                child: AspectRatio(
                  aspectRatio: 487 / 451,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(snap['postUrl']),
                        fit: BoxFit.fill,
                        alignment: FractionalOffset.topCenter,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          getVerticalSpace(20),
          const Divider(),
        ],
      ),
    );
  }

  Future<void> updateCaption(
      String postId, String text, BuildContext context) async {
    try {
      String res = await FirestoreMethods().updateData(text, postId);
      if (res == "Success") {
        // Set loading to false when done
        Provider.of<EditPostProvider>(context, listen: false).setLoading(false);

        showSnackbar(context, "Caption Updated!!");
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const BottomNavScreen()),
          (route) => false,
        );
      } else {
        Provider.of<EditPostProvider>(context, listen: false).setLoading(false);
        showSnackbar(context, res);
      }
    } catch (err) {
      Provider.of<EditPostProvider>(context, listen: false).setLoading(false);
      showSnackbar(context, err.toString());
    }
  }
}
