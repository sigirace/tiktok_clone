class UserProfileModel {
  final String uid;
  final String name;
  final String bio;
  final String link;
  final String email;
  final bool hasAvatar;

  UserProfileModel({
    required this.uid,
    required this.name,
    required this.bio,
    required this.link,
    required this.email,
    required this.hasAvatar,
  });

  UserProfileModel.empty()
      : uid = "",
        name = "",
        bio = "",
        link = "",
        email = "",
        hasAvatar = false;

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "bio": bio,
      "link": link,
      "email": email,
      "hasAvatar": hasAvatar,
    };
  }

  UserProfileModel.fromJson(Map<String, dynamic> json)
      : uid = json["uid"],
        name = json["name"],
        bio = json["bio"],
        link = json["link"],
        email = json["email"],
        hasAvatar = json["hasAvatar"];

  UserProfileModel copyWith({
    String? uid,
    String? name,
    String? bio,
    String? link,
    String? email,
    bool? hasAvatar,
  }) {
    return UserProfileModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      link: link ?? this.link,
      email: email ?? this.email,
      hasAvatar: hasAvatar ?? this.hasAvatar,
    );
  }
}
