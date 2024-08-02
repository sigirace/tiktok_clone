class VideoModel {
  final String id;
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
    required this.id,
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

  VideoModel.fromJson(
      {required Map<String, dynamic> data, required String videoId})
      : id = videoId,
        title = data["title"],
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
      "id": id,
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
