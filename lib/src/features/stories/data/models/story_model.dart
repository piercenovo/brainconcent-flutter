// import 'dart:convert';

// import 'package:brainconcent_flutter/src/features/stories/domain/entities/story.dart';

// StoryModel storyModelFromJson(String str) =>
//     StoryModel.fromJson(json.decode(str));

// String storyModelToJson(StoryModel data) => json.encode(data.toJson());

// class StoryModel extends Story {
//   const StoryModel({
//     required String name,
//     required String description,
//     required String image,
//     required String duration,
//     required String uid,
//   }) : super(
//           name: name,
//           description: description,
//           image: image,
//           duration: duration,
//           uid: uid,
//         );

//   factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
//         name: json["name"],
//         description: json["description"],
//         image: json["image"],
//         duration: json["duration"],
//         uid: json["uid"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "description": description,
//         "image": image,
//         "duration": duration,
//         "uid": uid,
//       };
// }

import 'dart:convert';

import 'package:brainconcent_flutter/src/features/stories/domain/entities/story.dart';

StoryModel storyModelFromJson(String str) =>
    StoryModel.fromJson(json.decode(str));

String storyModelToJson(StoryModel data) => json.encode(data.toJson());

class StoryModel extends Story {
  const StoryModel({
    required String name,
    required String description,
    required String image,
    required String duration,
    required List<String> chapterTitles,
    required List<String> chapterDuration,
    required List<String> chapterVideos,
    required String uid,
  }) : super(
          name: name,
          description: description,
          image: image,
          duration: duration,
          chapterTitles: chapterTitles,
          chapterDuration: chapterDuration,
          chapterVideos: chapterVideos,
          uid: uid,
        );

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        name: json["name"],
        description: json["description"],
        image: json["image"],
        duration: json["duration"],
        chapterTitles: List<String>.from(json["chapterTitles"].map((x) => x)),
        chapterDuration:
            List<String>.from(json["chapterDuration"].map((x) => x)),
        chapterVideos: List<String>.from(json["chapterVideos"].map((x) => x)),
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "image": image,
        "duration": duration,
        "chapterTitles": List<dynamic>.from(chapterTitles.map((x) => x)),
        "chapterDuration": List<dynamic>.from(chapterDuration.map((x) => x)),
        "chapterVideos": List<dynamic>.from(chapterVideos.map((x) => x)),
        "uid": uid,
      };
}
