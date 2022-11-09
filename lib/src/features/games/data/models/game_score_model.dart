import 'dart:convert';

import 'package:brainconcent_flutter/src/features/games/domain/entities/game/game_score.dart';

GameScoreModel gameScoreModelFromJson(String str) =>
    GameScoreModel.fromJson(json.decode(str));

String gameScoreModelToJson(GameScoreModel data) => json.encode(data.toJson());

class GameScoreModel extends GameScore {
  const GameScoreModel({
    required int time,
    required int tap,
    required DateTime date,
    required String userId,
    required String gameId,
    required String uid,
  }) : super(
          time: time,
          tap: tap,
          date: date,
          userId: userId,
          gameId: gameId,
          uid: uid,
        );

  factory GameScoreModel.fromJson(Map<String, dynamic> json) => GameScoreModel(
        time: json["time"],
        tap: json["tap"],
        date: DateTime.parse(json["date"]),
        userId: json["userId"],
        gameId: json["gameId"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "tap": tap,
        "date": date.toIso8601String(),
        "userId": userId,
        "gameId": gameId,
        "uid": uid,
      };
}
