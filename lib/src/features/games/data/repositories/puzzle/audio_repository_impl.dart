import 'dart:async';
import 'package:brainconcent_flutter/src/features/games/domain/repositories/puzzle/audio_repository.dart';
import 'package:just_audio/just_audio.dart';

class AudioRepositoryImpl implements AudioRepository {
  bool _isPlaying = false;
  final AudioPlayer _player;

  AudioRepositoryImpl(this._player) {
    _player.setVolume(0.5);
  }

  @override
  Future<void> playMove() async {
    if (_isPlaying) {
      return;
    }

    _isPlaying = true;
    final duration = await _player.setAsset(
      'assets/sounds/animals/pull-out.mp3',
    );
    if (duration != null) {
      unawaited(_player.play());
    }
    _isPlaying = false;
  }

  @override
  Future<void> playWinner() async {}

  @override
  Future<void> dispose() {
    return _player.dispose();
  }

  @override
  Future<void> play(String asset) async {
    final duration = await _player.setAsset(
      asset,
    );
    if (duration != null) {
      unawaited(_player.play());
    }
  }
}
