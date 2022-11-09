import 'dart:convert';

import 'package:brainconcent_flutter/src/features/games/data/models/game_score_model.dart';

GameScoresResponse gameScoresResponseFromJson(String str) =>
    GameScoresResponse.fromJson(json.decode(str));

String gameScoresResponseToJson(GameScoresResponse data) =>
    json.encode(data.toJson());

class GameScoresResponse {
  GameScoresResponse({
    required this.resp,
    required this.message,
    required this.gamescores,
  });

  bool resp;
  String message;
  List<GameScoreModel> gamescores;

  factory GameScoresResponse.fromJson(Map<String, dynamic> json) =>
      GameScoresResponse(
        resp: json["resp"],
        message: json["message"],
        gamescores: List<GameScoreModel>.from(
            json["gamescores"].map((x) => GameScoreModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "message": message,
        "gamescores": List<dynamic>.from(gamescores.map((x) => x.toJson())),
      };
}
