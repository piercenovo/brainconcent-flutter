import 'dart:convert';

import 'package:brainconcent_flutter/src/core/env/environment_config.dart';
import 'package:brainconcent_flutter/src/features/stories/data/models/story_model.dart';
import 'package:brainconcent_flutter/src/features/stories/domain/responses/stories_response.dart';
import 'package:brainconcent_flutter/src/features/stories/domain/services/story_services.dart';
import 'package:http/http.dart' as http;

class StoryServicesImpl implements StoryServices {
  @override
  Future<List<StoryModel>> getStories() async {
    final resp = await http.get(
        Uri.parse('${EnvironmentConfig.apiUrl}/story/get-stories'),
        headers: {'Accept': 'application/json'});

    return StoriesResponse.fromJson(jsonDecode(resp.body)).stories;
  }
}

final storyServices = StoryServicesImpl();
