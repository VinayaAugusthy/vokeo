import 'package:vokeo/domain/comments/comments.dart';

class PostModel {
  final String? postId;
  final String username;
  final String imagePath;
  final String? caption;
  final DateTime timestamp;
  final List<String> likes;
  final List<Comment> comments;

  PostModel({
    this.postId,
    required this.username,
    required this.imagePath,
    this.caption,
    required this.timestamp,
    required this.likes,
    required this.comments,
  });

  toJson() {
    return {
      "username": username,
      "caption": caption,
      "post pic": imagePath,
      "likes": likes,
      "timestamp": timestamp,
    };
  }
}
