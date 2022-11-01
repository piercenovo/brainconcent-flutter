import 'package:brainconcent_flutter/src/features/games/data/models/game_model.dart';
import 'package:dartz/dartz.dart';

abstract class GameLocalDataSource {
  Future<List<GameModel>> getCachedGames();
  Future<Unit> cacheGames(List<GameModel> gameModels);
}
