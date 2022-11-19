import 'dart:async';
import 'dart:typed_data';

import 'package:brainconcent_flutter/src/features/games/data/repositories/puzzle/images_repository_impl.dart';
import 'package:brainconcent_flutter/src/features/games/domain/entities/puzzle/move_to.dart';
import 'package:brainconcent_flutter/src/features/games/domain/entities/puzzle/puzzle.dart';
import 'package:brainconcent_flutter/src/features/games/domain/entities/puzzle/puzzle_image.dart';
import 'package:brainconcent_flutter/src/features/games/domain/entities/puzzle/tile.dart';
import 'package:brainconcent_flutter/src/features/games/domain/repositories/puzzle/audio_repository.dart';
import 'package:brainconcent_flutter/src/features/games/domain/repositories/puzzle/images_repository.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/puzzle_game/controller/puzzle_state.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PuzzleController extends ChangeNotifier {
  final ImagesRepository _imagesRepository = GetIt.I.get();
  final AudioRepository audioRepository = GetIt.I.get();

  PuzzleState _state = PuzzleState(
    crossAxisCount: 3,
    puzzle: Puzzle.create(3),
    solved: false,
    moves: 0,
    sound: true,
    status: PuzzleStatus.created,
  );

  List<bool> getInitialItemState(LevelP level) {
    List<bool> initialItemState = <bool>[];
    if (level == LevelP.hard) {
      _state = PuzzleState(
        crossAxisCount: 5,
        puzzle: Puzzle.create(5),
        solved: false,
        moves: 0,
        sound: true,
        status: PuzzleStatus.created,
      );
    } else if (level == LevelP.medium) {
      _state = PuzzleState(
        crossAxisCount: 4,
        puzzle: Puzzle.create(4, image: puzzle.image),
        solved: false,
        moves: 0,
        sound: true,
        status: PuzzleStatus.created,
      );
    } else if (level == LevelP.easy) {
      _state = PuzzleState(
        crossAxisCount: 3,
        puzzle: Puzzle.create(3, image: puzzleOptions[2]),
        solved: false,
        moves: 0,
        sound: true,
        status: PuzzleStatus.created,
      );
    }
    return initialItemState;
  }

  final ValueNotifier<int> time = ValueNotifier(0);

  final StreamController<void> _streamController = StreamController.broadcast();

  Stream<void> get onFinish => _streamController.stream;

  Timer? _timer;

  PuzzleState get state => _state;

  Puzzle get puzzle => _state.puzzle;

  void onTileTapped(Tile tile) {
    final canMove = puzzle.canMove(tile.position);
    // if the tile can be moved
    if (canMove) {
      // move the tile or multiple tiles
      final newPuzzle = puzzle.move(tile);

      // check if the puzzle is solved
      final solved = newPuzzle.isSolved();
      _state = state.copyWith(
          puzzle: newPuzzle,
          moves: state.moves + 1,
          status: solved ? PuzzleStatus.solved : state.status);
      notifyListeners();

      if (state.sound) {
        // play a sound
        audioRepository.playMove();
      }

      if (solved) {
        _timer?.cancel();

        // notify to the game view
        _streamController.sink.add(null);
      }
    }
  }

  // shuffle the current puzzle
  void shuffle() {
    if (_timer != null) {
      time.value = 0;
      _timer!.cancel();
    }
    _state = state.copyWith(
        puzzle: puzzle.shuffle(), status: PuzzleStatus.playing, moves: 0);
    notifyListeners();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      time.value++;
    });
  }

  // change the current size of the puzzle
  //
  //
  // [crossAxisCount] number of rows and columns
  //
  // [image] is different of null when the puzzle
  // has to be a segmented image
  Future<void> changeGrid(int crossAxisCount, PuzzleImage? image) async {
    _timer?.cancel();
    time.value = 0;

    List<Uint8List>? segmentedImage;

    if (image != null) {
      segmentedImage = await _imagesRepository.split(
        image.assetPath,
        crossAxisCount,
      );
    }

    // reset the game with a new puzzle
    final newState = PuzzleState(
        crossAxisCount: crossAxisCount,
        puzzle: Puzzle.create(crossAxisCount,
            segmentedImage: segmentedImage, image: image),
        solved: false,
        moves: 0,
        status: PuzzleStatus.created,
        sound: state.sound);
    _state = newState;
    notifyListeners();
  }

  void toggleSound() {
    _state = state.copyWith(
      sound: !state.sound,
    );
    notifyListeners();
  }

  // the keyboard action can move a tile using as
  // handle the keyboard events and  check if
  // reference the empty position
  void onMoveByKeyboard(MoveTo moveTo) {
    final index = _handleKeyboard(moveTo, state);

    if (index != null) {
      onTileTapped(
        puzzle.tiles[index],
      );
    }
  }

  // handle the keyboard events and  check if
  // the keyboard action can move a tile using as
  // reference the empty position
  //
  // return [int] the index tile to be moved, if any
  // tile can be moved the value returned is null
  int? _handleKeyboard(MoveTo moveTo, PuzzleState state) {
    final crossAxisCount = state.crossAxisCount;
    final emptyPosition = puzzle.emptyPosition;
    final tiles = puzzle.tiles;

    // will store the tile index to be moved
    int? index;

    switch (moveTo) {
      case MoveTo.up:
        if (emptyPosition.y + 1 <= crossAxisCount) {
          index = tiles.indexWhere(
            (e) {
              return e.position.x == emptyPosition.x &&
                  e.position.y == emptyPosition.y + 1;
            },
          );
        }
        break;
      case MoveTo.down:
        if (emptyPosition.y > 0) {
          index = tiles.indexWhere(
            (e) {
              return e.position.x == emptyPosition.x &&
                  e.position.y == emptyPosition.y - 1;
            },
          );
        }
        break;
      case MoveTo.left:
        if (emptyPosition.x >= 1) {
          index = tiles.indexWhere(
            (e) {
              return e.position.x - 1 == emptyPosition.x &&
                  e.position.y == emptyPosition.y;
            },
          );
        }
        break;
      case MoveTo.right:
        if (emptyPosition.x <= crossAxisCount) {
          index = tiles.indexWhere(
            (e) {
              return e.position.x + 1 == emptyPosition.x &&
                  e.position.y == emptyPosition.y;
            },
          );
        }
        break;
    }

    return index;
  }

  // release memory
  @override
  void dispose() {
    _streamController.close();
    _timer?.cancel();
    super.dispose();
  }
}
