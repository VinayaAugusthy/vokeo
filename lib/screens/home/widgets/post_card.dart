// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vokeo/screens/home/widgets/save_posts.dart';
import '../../../providers/posts/post_provider.dart';
import '../../../providers/user_provider.dart';
import '../../../resourses/firestore_methods.dart';
import '../../../utils/utils.dart';
import '../../comment/comment_screen.dart';
import '../../edit_post/edit_post_screen.dart';
import '../../profile/profile_scree.dart';
import '../../search/view_post.dart';
import '../../widgets/like_animation.dart';

class PostCard extends StatelessWidget {
  final Map<String, dynamic> snap;
  const PostCard({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).getUser;

    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width * 0.005,
        horizontal: MediaQuery.of(context).size.width * 0.005,
      ),
      child: Column(
        children: [
          buildHeader(context),
          GestureDetector(
            onDoubleTap: () async {
              await FirestoreMethods().likePost(
                user!.uid,
                snap['postId'],
                snap['likes'],
              );
            },
            child: buildImageStack(context),
          ),
          buildActionRow(context),
          buildPostInfo(context),
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 16,
      ).copyWith(right: 0),
      child: Row(
        children: [
          buildAvatar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(uid: snap['uid']),
                  ),
                ),
                child: Text(
                  snap['username'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          buildPopupMenu(context),
        ],
      ),
    );
  }

  Widget buildAvatar() {
    return CircleAvatar(
      radius: 16,
      backgroundImage: NetworkImage(snap['profileImage']),
    );
  }

  Widget buildPopupMenu(BuildContext context) {
    return snap['uid'] == FirebaseAuth.instance.currentUser!.uid
        ? editOrDeletePosts(context)
        : const SavePosts();
  }

  PopupMenuButton<int> editOrDeletePosts(BuildContext context) {
    return PopupMenuButton(
      color: Colors.black,
      icon: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      onSelected: (value) {
        if (value == 0) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditPostScreen(snap: snap),
            ),
          );
        }
        if (value == 1) {
          deletePost(snap['postId'].toString(), context);
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            value: 0,
            child: Text('Edit', style: TextStyle(color: Colors.white)),
          ),
          const PopupMenuItem(
            value: 1,
            child: Text('Delete', style: TextStyle(color: Colors.white)),
          ),
        ];
      },
    );
  }

  Widget buildImageStack(BuildContext context) {
    final postCardProvider = Provider.of<PostCardProvider>(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ViewPost(postUrl: snap['postUrl']),
            ),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image(
              image: NetworkImage(snap['postUrl']),
              fit: BoxFit.cover,
            ),
          ),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: postCardProvider.isLikeAnimating ? 1 : 0,
          child: LikeAnimation(
            isAnimating: postCardProvider.isLikeAnimating,
            duration: const Duration(milliseconds: 400),
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 100,
            ),
          ),
        )
      ],
    );
  }

  Widget buildActionRow(BuildContext context) {
    final user = Provider.of<UserProvider>(context).getUser;
    return Row(
      children: [
        LikeAnimation(
          isAnimating: snap['likes'].contains(user!.uid),
          smallLike: true,
          child: IconButton(
            onPressed: () async {
              await FirestoreMethods().likePost(
                user.uid,
                snap['postId'],
                snap['likes'],
              );

              if (snap['uid'] != FirebaseAuth.instance.currentUser!.uid &&
                  snap['likes'].contains(user.uid)) {
                await FirestoreMethods().showNotifications(
                  postUrl: snap['postUrl'],
                  postId: snap['postId'],
                  text: "liked",
                  owner: snap['uid'],
                  name: user.username,
                  profilePic: user.photoUrl,
                  uid: FirebaseAuth.instance.currentUser!.uid,
                );
              }
            },
            icon: snap['likes'].contains(user.uid)
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CommentScreen(snap: snap),
              ),
            );
          },
          icon: const Icon(
            Icons.comment_outlined,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget buildPostInfo(BuildContext context) {
    final postCardProvider = Provider.of<PostCardProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.03,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${snap['likes'].length}  Likes",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: snap['username'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "  ${snap['description']}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                "View all ${postCardProvider.commentCount} comments",
                style: TextStyle(
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              DateFormat.yMMMd().format(
                snap['datePublished'].toDate(),
              ),
              style: TextStyle(
                color: Colors.grey.shade500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void deletePost(String postId, BuildContext context) async {
    String res = await FirestoreMethods().deletePost(postId);
    if (res == "Deleted") {
      showSnackbar(context, "Post Deleted");
    }
  }
}
