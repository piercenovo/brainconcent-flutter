import 'package:brainconcent_flutter/src/features/stories/domain/entities/story.dart';
import 'package:brainconcent_flutter/src/features/stories/presentation/views/story_detail/widgets/body.dart';
import 'package:flutter/material.dart';

class StoryDetailScreen extends StatelessWidget {
  final Story story;
  const StoryDetailScreen({
    Key? key,
    required this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(story: story),
    );
  }
}
