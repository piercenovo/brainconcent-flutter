import 'dart:convert';

import 'package:brainconcent_flutter/src/core/env/environment_config.dart';
import 'package:brainconcent_flutter/src/features/authentication/domain/responses/default_response.dart';
import 'package:brainconcent_flutter/src/features/games/domain/services/game_score_services.dart';
import 'package:http/http.dart' as http;

class GameScoreServicesImpl implements GameScoreServices {
  @override
  Future<DefaultResponse> createGameScore(
      String time, String tap, String userId, String gameId) async {
    final resp = await http.post(
        Uri.parse('${EnvironmentConfig.apiUrl}/game-score/create-game-score'),
        headers: {
          'Accept': 'application/json'
        },
        body: {
          'time': time,
          'tap': tap,
          'userId': userId,
          'gameId': gameId,
        });
    return DefaultResponse.fromJson(jsonDecode(resp.body));
  }
}

final gameScoreServices = GameScoreServicesImpl();
