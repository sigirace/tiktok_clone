import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/features/videos/models/video_model.dart';
import 'package:tictok_clone/features/videos/repos/videos_repo.dart';

class TimeLineViewModel extends AsyncNotifier<List<VideoModel>> {
  late final VideosRepository _repository;
  List<VideoModel> _list = [];

  @override
  FutureOr<List<VideoModel>> build() async {
    _repository = ref.read(videosRepo);
    final result = await _repository.fetchVideos();
    final newList = result.docs.map(
      (video) => VideoModel.fromJson(
        video.data(),
      ),
    );
    _list = newList.toList();
    return _list;
  }
}

final timelineProvider =
    AsyncNotifierProvider<TimeLineViewModel, List<VideoModel>>(
  () => TimeLineViewModel(),
);
