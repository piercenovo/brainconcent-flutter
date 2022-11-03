import 'dart:convert';

import 'package:brainconcent_flutter/src/features/characters/data/models/character_model.dart';

CharactersResponse charactersResponseFromJson(String str) =>
    CharactersResponse.fromJson(json.decode(str));

String charactersResponseToJson(CharactersResponse data) =>
    json.encode(data.toJson());

class CharactersResponse {
  CharactersResponse({
    required this.resp,
    required this.message,
    required this.characters,
  });

  bool resp;
  String message;
  List<CharacterModel> characters;

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      CharactersResponse(
        resp: json["resp"],
        message: json["message"],
        characters: List<CharacterModel>.from(
            json["characters"].map((x) => CharacterModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "message": message,
        "characters": List<dynamic>.from(characters.map((x) => x.toJson())),
      };
}
