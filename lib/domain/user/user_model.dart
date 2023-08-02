class UserModel {
  final String email;
  final String imagePath;
  final String fullName;
  final String userName;
  final String? bio;
  final List? followers;
  final List? following;

  UserModel({
    required this.email,
    required this.imagePath,
    required this.fullName,
    required this.userName,
    this.bio,
    this.followers,
    this.following,
  });
  toJson() {
    return {
      "email": email,
      "fullName": fullName,
      "username": userName,
      "profile pic": imagePath,
      "bio": bio,
      "followers": [],
      "following": [],
    };
  }
}
