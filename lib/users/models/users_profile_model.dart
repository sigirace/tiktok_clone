class UserProfileModel {
  final String uid;
  final String name;
  final String bio;
  final String link;
  final String email;

  UserProfileModel({
    required this.uid,
    required this.name,
    required this.bio,
    required this.link,
    required this.email,
  });

  UserProfileModel.empty()
      : uid = "",
        name = "",
        bio = "",
        link = "",
        email = "";

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "bio": bio,
      "link": link,
      "email": email,
    };
  }
}
