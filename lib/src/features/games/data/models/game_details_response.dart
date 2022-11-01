// To parse this JSON data, do
//
//     final gameDetails = gameDetailsFromJson(jsonString);

import 'dart:convert';

import 'package:brainconcent_flutter/src/features/games/data/models/game_details_model.dart';

GameDetails gameDetailsFromJson(String str) =>
    GameDetails.fromJson(json.decode(str));

String gameDetailsToJson(GameDetails data) => json.encode(data.toJson());

class GameDetails {
  GameDetails({
    required this.resp,
    required this.gameDetail,
  });

  bool resp;
  GameDetail gameDetail;

  factory GameDetails.fromJson(Map<String, dynamic> json) => GameDetails(
        resp: json["resp"],
        gameDetail: GameDetail.fromJson(json["gameDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "gameDetail": gameDetail.toJson(),
      };
}
