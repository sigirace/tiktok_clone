import 'package:flutter_test/flutter_test.dart';
import 'package:tictok_clone/features/videos/models/video_model.dart';

//Test
void main() {
  group("video model test", () {
    test("Test Constructor", () {
      final video = VideoModel(
        id: "1",
        fileUrl: "url",
        creatorUid: "user",
        creator: "creator",
        description: "description",
        title: "songName",
        likes: 0,
        comments: 0,
        createdAt: 0,
        thumbnailUrl: "albumUrl",
      );
      expect(video.id, "1");
    });

    test("Test fromJson", () {
      final video = VideoModel.fromJson(
        data: {
          "title": "songName",
          "description": "description",
          "fileUrl": "url",
          "thumbnailUrl": "albumUrl",
          "creatorUid": "user",
          "likes": 0,
          "comments": 0,
          "createdAt": 0,
          "creator": "creator",
        },
        videoId: "1",
      );
      expect(video.title, "songName");
    });

    test("Test toJson", () {
      final video = VideoModel(
        id: "1",
        fileUrl: "url",
        creatorUid: "user",
        creator: "creator",
        description: "description",
        title: "songName",
        likes: 0,
        comments: 0,
        createdAt: 0,
        thumbnailUrl: "albumUrl",
      );
      final json = video.toJson();
      expect(json["title"], "songName");
      expect(json["like"], isInstanceOf<int>());
    });
  });
}
