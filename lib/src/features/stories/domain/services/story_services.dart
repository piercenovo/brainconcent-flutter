import 'package:brainconcent_flutter/src/features/stories/data/models/story_model.dart';

abstract class StoryServices {
  Future<List<StoryModel>> getStories();
}
