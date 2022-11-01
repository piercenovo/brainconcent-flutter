import 'package:brainconcent_flutter/src/features/games/data/models/game_model.dart';

abstract class GameRemoteDataSource {
  Future<List<GameModel>> getAllGames();
}
