class UserModel {
  final String imagePath;
  final String fullName;
  final String userName;
  final String? bio;

  UserModel(
      {required this.imagePath,
      required this.fullName,
      required this.userName,
      this.bio});
  toJson() {
    return {
      "fullName": fullName,
      "username": userName,
      "profile pic": imagePath,
      "bio": bio,
    };
  }
}
