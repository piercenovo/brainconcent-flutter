// ignore_for_file: file_names

import 'dart:convert';
import 'package:brainconcent_flutter/src/core/env/environment_config.dart';
import 'package:brainconcent_flutter/src/features/games/data/datasources/remote/game_remote_data_source.dart';
import 'package:brainconcent_flutter/src/features/games/data/models/game_model.dart';

import '../../../../../core/error/exceptions.dart';
import 'package:http/http.dart' as http;

class HttpGameDataSource implements GameRemoteDataSource {
  final http.Client client;

  HttpGameDataSource({required this.client});
  @override
  Future<List<GameModel>> getAllGames() async {
    final response = await client.get(
      Uri.parse('${EnvironmentConfig.apiUrl}/game/get-games'),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      final List<GameModel> gameModels = decodedJson['games']
          .map<GameModel>((jsonGameModel) => GameModel.fromJson(jsonGameModel))
          .toList();
      return gameModels;
    } else {
      throw ServerException();
    }
  }
}
