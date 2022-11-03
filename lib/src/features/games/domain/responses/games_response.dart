import 'dart:convert';

import 'package:brainconcent_flutter/src/features/games/data/models/game_model.dart';

GamesResponse gamesResponseFromJson(String str) =>
    GamesResponse.fromJson(json.decode(str));

String gamesResponseToJson(GamesResponse data) => json.encode(data.toJson());

class GamesResponse {
  GamesResponse({
    required this.resp,
    required this.message,
    required this.games,
  });

  bool resp;
  String message;
  List<GameModel> games;

  factory GamesResponse.fromJson(Map<String, dynamic> json) => GamesResponse(
        resp: json["resp"],
        message: json["message"],
        games: List<GameModel>.from(
            json["games"].map((x) => GameModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "message": message,
        "games": List<dynamic>.from(games.map((x) => x.toJson())),
      };
}
