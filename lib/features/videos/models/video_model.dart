class VideoModel {
  final String title;
  final String description;
  final String fileUrl;
  final String thumbnailUrl;
  final String creatorUid;
  final int likes;
  final int comments;
  final int createdAt;
  final String creator;

  VideoModel({
    required this.title,
    required this.description,
    required this.fileUrl,
    required this.thumbnailUrl,
    required this.creatorUid,
    required this.likes,
    required this.comments,
    required this.createdAt,
    required this.creator,
  });

  VideoModel.fromJson(Map<String, dynamic> data)
      : title = data["title"],
        description = data["description"],
        fileUrl = data["fileUrl"],
        thumbnailUrl = data["thumbnailUrl"],
        creatorUid = data["creatorUid"],
        likes = data["likes"],
        comments = data["comments"],
        createdAt = data["createdAt"],
        creator = data["creator"];

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "fileUrl": fileUrl,
      "thumbnailUrl": thumbnailUrl,
      "creatorUid": creatorUid,
      "likes": likes,
      "comments": comments,
      "createdAt": createdAt,
      "creator": creator,
    };
  }
}
