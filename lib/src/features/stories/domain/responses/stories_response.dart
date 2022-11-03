import 'dart:convert';

import 'package:brainconcent_flutter/src/features/stories/data/models/story_model.dart';

StoriesResponse storyResponseFromJson(String str) =>
    StoriesResponse.fromJson(json.decode(str));

String storyResponseToJson(StoriesResponse data) => json.encode(data.toJson());

class StoriesResponse {
  StoriesResponse({
    required this.resp,
    required this.message,
    required this.stories,
  });

  bool resp;
  String message;
  List<StoryModel> stories;

  factory StoriesResponse.fromJson(Map<String, dynamic> json) =>
      StoriesResponse(
        resp: json["resp"],
        message: json["message"],
        stories: List<StoryModel>.from(
            json["stories"].map((x) => StoryModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "message": message,
        "stories": List<dynamic>.from(stories.map((x) => x.toJson())),
      };
}
