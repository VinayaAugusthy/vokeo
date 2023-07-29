import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vokeo/core/constants/colors.dart';
import 'package:vokeo/core/constants/constants.dart';
import '../../../../appllication/profile/profile_data.dart';
import '../../../../domain/post/post_model.dart';
import '../../../widget/timestamp.dart';

Widget postCard(Size size, PostModel post, BuildContext context) {
  final userProvider = context.read<UserProvider>();

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: size.width,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: FutureBuilder(
              future: userProvider.getProfilePictureUrl(post.username),
              builder: (context, snapshot) {
                String? imageUrl = snapshot.data as String?;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircleAvatar(
                    backgroundImage: NetworkImage(dp),
                  );
                } else if (snapshot.hasError) {
                  return const CircleAvatar(
                    backgroundColor: greyColor,
                  );
                } else {
                  return CircleAvatar(
                    // radius: 20,
                    backgroundImage: NetworkImage(imageUrl!),
                  );
                }
              },
            ),
            title: Text(post.username),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                )),
          ),

          Container(
            height: 280,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(post.imagePath), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline,
                    size: 28,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.comment_bank_outlined,
                    size: 28,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                    size: 28,
                  )),
              //
              const Spacer(),
              // Icon(Icons.bookmark_border,size: 30,),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_border,
                    size: 28,
                  )),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              '${post.likes.length} likes',
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              post.caption != null ? post.caption.toString() : "",
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              formatDateTime(post.timestamp),
              style: const TextStyle(fontSize: 16, color: greyColor),
            ),
          )
        ],
      ),
    ),
  );
}
