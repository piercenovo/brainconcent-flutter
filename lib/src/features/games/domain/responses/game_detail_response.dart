// To parse this JSON data, do
//
//     final gameDetails = gameDetailsFromJson(jsonString);

import 'dart:convert';

import 'package:brainconcent_flutter/src/features/games/data/models/game_detail_model.dart';

GameDetailResponse gameDetailsFromJson(String str) =>
    GameDetailResponse.fromJson(json.decode(str));

String gameDetailsToJson(GameDetailResponse data) => json.encode(data.toJson());

class GameDetailResponse {
  GameDetailResponse({
    required this.resp,
    required this.gameDetail,
  });

  bool resp;
  GameDetailModel gameDetail;

  factory GameDetailResponse.fromJson(Map<String, dynamic> json) =>
      GameDetailResponse(
        resp: json["resp"],
        gameDetail: GameDetailModel.fromJson(json["gameDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "gameDetail": gameDetail.toJson(),
      };
}
