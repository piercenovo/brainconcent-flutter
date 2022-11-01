import 'package:brainconcent_flutter/src/features/games/domain/entities/game.dart';

class GameModel extends Game {
  const GameModel({
    required String name,
    required String category,
    required String image,
    required String link,
    required String description,
    required List<String> skillsTitles,
    required List<String> skillsImages,
    String? uid,
  }) : super(
            name: name,
            category: category,
            image: image,
            link: link,
            description: description,
            skillsTitles: skillsTitles,
            skillsImages: skillsImages,
            uid: uid);

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        name: json["name"],
        category: json["category"],
        image: json["image"],
        link: json["link"],
        description: json["description"],
        skillsTitles: List<String>.from(json["skillsTitles"].map((x) => x)),
        skillsImages: List<String>.from(json["skillsImages"].map((x) => x)),
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "category": category,
        "image": image,
        "link": link,
        "description": description,
        "skillsTitles": List<dynamic>.from(skillsTitles.map((x) => x)),
        "skillsImages": List<dynamic>.from(skillsImages.map((x) => x)),
        "uid": uid,
      };
}
