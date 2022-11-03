import 'dart:convert';

import 'package:brainconcent_flutter/src/features/characters/domain/entities/character.dart';

CharacterModel characterModelFromJson(String str) =>
    CharacterModel.fromJson(json.decode(str));

String characterModelToJson(CharacterModel data) => json.encode(data.toJson());

class CharacterModel extends Character {
  const CharacterModel({
    required String name,
    required String image,
    required String link,
    required String colour,
    required String ageImage,
    required String countryImage,
    required String toyImage,
    required String detailImage,
    required String story,
    required String uid,
  }) : super(
          name: name,
          image: image,
          link: link,
          colour: colour,
          ageImage: ageImage,
          countryImage: countryImage,
          toyImage: toyImage,
          detailImage: detailImage,
          story: story,
          uid: uid,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        name: json["name"],
        image: json["image"],
        link: json["link"],
        colour: json["colour"],
        ageImage: json["ageImage"],
        countryImage: json["countryImage"],
        toyImage: json["toyImage"],
        detailImage: json["detailImage"],
        story: json["story"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "link": link,
        "colour": colour,
        "ageImage": ageImage,
        "countryImage": countryImage,
        "toyImage": toyImage,
        "detailImage": detailImage,
        "story": story,
        "uid": uid,
      };
}
