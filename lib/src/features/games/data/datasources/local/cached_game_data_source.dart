import 'dart:convert';

import 'package:brainconcent_flutter/src/features/games/data/datasources/local/game_local_data_source.dart';
import 'package:brainconcent_flutter/src/features/games/data/models/game_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/error/exceptions.dart';

// ignore: constant_identifier_names
const CACHED_GAMES = "CACHED_GAMES";

class CachedGameDataSource implements GameLocalDataSource {
  final SharedPreferences sharedPreferences;

  CachedGameDataSource({required this.sharedPreferences});
  @override
  Future<Unit> cacheGames(List<GameModel> gameModels) {
    List gameModelsToJson = gameModels
        .map<Map<String, dynamic>>((gameModel) => gameModel.toJson())
        .toList();
    sharedPreferences.setString(CACHED_GAMES, json.encode(gameModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<GameModel>> getCachedGames() {
    final jsonString = sharedPreferences.getString(CACHED_GAMES);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<GameModel> jsonToGameModels = decodeJsonData
          .map<GameModel>((jsonGameModel) => GameModel.fromJson(jsonGameModel))
          .toList();
      return Future.value(jsonToGameModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
