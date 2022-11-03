// ignore_for_file: file_names

import 'dart:convert';
import 'package:brainconcent_flutter/src/core/env/environment_config.dart';
import 'package:brainconcent_flutter/src/features/games/data/datasources/remote/game_remote_data_source.dart';
import 'package:brainconcent_flutter/src/features/games/data/models/game_model.dart';
import 'package:brainconcent_flutter/src/features/games/domain/responses/games_response.dart';

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
      return GamesResponse.fromJson(jsonDecode(response.body)).games;
    } else {
      throw ServerException();
    }
  }
}
