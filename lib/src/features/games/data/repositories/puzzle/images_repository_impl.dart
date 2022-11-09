import 'dart:math' as math;
import 'package:brainconcent_flutter/src/features/games/domain/entities/puzzle/puzzle_image.dart';
import 'package:brainconcent_flutter/src/features/games/domain/repositories/puzzle/images_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart';

const puzzleOptions = <PuzzleImage>[
  PuzzleImage(
    name: 'Numeric',
    assetPath: 'assets/images/puzzle/numeric-puzzle.png',
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Lion',
    assetPath: 'assets/images/animals/lion.png',
    soundPath: 'assets/sounds/animals/lion.mp3',
  ),
  PuzzleImage(
    name: 'Cat',
    assetPath: 'assets/images/animals/cat.png',
    soundPath: 'assets/sounds/animals/cat.mp3',
  ),
  PuzzleImage(
    name: 'Dog',
    assetPath: 'assets/images/animals/dog.png',
    soundPath: 'assets/sounds/animals/dog.mp3',
  ),
  PuzzleImage(
    name: 'Fox',
    assetPath: 'assets/images/animals/fox.png',
    soundPath: 'assets/sounds/animals/fox.mp3',
  ),
  PuzzleImage(
    name: 'Koala',
    assetPath: 'assets/images/animals/koala.png',
    soundPath: 'assets/sounds/animals/koala.mp3',
  ),
  PuzzleImage(
    name: 'Monkey',
    assetPath: 'assets/images/animals/monkey.png',
    soundPath: 'assets/sounds/animals/monkey.mp3',
  ),
  PuzzleImage(
    name: 'Mouse',
    assetPath: 'assets/images/animals/mouse.png',
    soundPath: 'assets/sounds/animals/mouse.mp3',
  ),
  PuzzleImage(
    name: 'Panda',
    assetPath: 'assets/images/animals/panda.png',
    soundPath: 'assets/sounds/animals/panda.mp3',
  ),
  PuzzleImage(
    name: 'Penguin',
    assetPath: 'assets/images/animals/penguin.png',
    soundPath: 'assets/sounds/animals/penguin.mp3',
  ),
  PuzzleImage(
    name: 'Tiger',
    assetPath: 'assets/images/animals/tiger.png',
    soundPath: 'assets/sounds/animals/tiger.mp3',
  ),
];

Future<Image> decodeAsset(ByteData bytes) async {
  return decodeImage(
    bytes.buffer.asUint8List(),
  )!;
}

class SPlitData {
  final Image image;
  final int crossAxisCount;

  SPlitData(this.image, this.crossAxisCount);
}

Future<List<Uint8List>> splitImage(SPlitData data) {
  final image = data.image;
  final crossAxisCount = data.crossAxisCount;
  final int length = (image.width / crossAxisCount).round();
  List<Uint8List> pieceList = [];

  for (int y = 0; y < crossAxisCount; y++) {
    for (int x = 0; x < crossAxisCount; x++) {
      pieceList.add(
        Uint8List.fromList(
          encodePng(
            copyCrop(
              image,
              x * length,
              y * length,
              length,
              length,
            ),
          ),
        ),
      );
    }
  }
  return Future.value(pieceList);
}

class ImagesRepositoryImpl implements ImagesRepository {
  Map<String, Image> cache = {};

  @override
  Future<List<Uint8List>> split(String asset, int crossAxisCount) async {
    late Image image;
    if (cache.containsKey(asset)) {
      image = cache[asset]!;
    } else {
      final bytes = await rootBundle.load(asset);

      /// use compute because theimage package is a pure dart package
      /// so to avoid bad ui performance we do this task in a different
      /// isolate
      image = await compute(decodeAsset, bytes);

      final width = math.min(image.width, image.height);

      /// convert to square
      image = copyResizeCropSquare(image, width);
      cache[asset] = image;
    }

    final pieces = await compute(
      splitImage,
      SPlitData(image, crossAxisCount),
    );

    return pieces;
  }
}
