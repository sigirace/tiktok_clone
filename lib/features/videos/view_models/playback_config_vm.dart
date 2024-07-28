import 'package:flutter/material.dart';
import 'package:tictok_clone/features/videos/models/playback_config_model.dart';
import 'package:tictok_clone/features/videos/repos/playback_config_repo.dart';

class PlaybackConfigViewModel extends ChangeNotifier {
  final PlaybackConfigRepository _repository;

  late final PlaybackConfigModel _model = PlaybackConfigModel(
    muted: _repository.isMuted(),
    autoPlay: _repository.isAuto(),
  );

  PlaybackConfigViewModel(this._repository);

  void setMuted(bool value) {
    _repository.setMuted(value);
    _model.muted = value;
    notifyListeners();
  }

  void setAutoplay(bool value) {
    _repository.setAutoplay(value);
    _model.autoPlay = value;
    notifyListeners();
  }

  bool get muted => _model.muted;

  bool get autoplay => _model.autoPlay;
}
