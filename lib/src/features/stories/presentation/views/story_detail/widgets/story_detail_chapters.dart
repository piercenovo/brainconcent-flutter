import 'package:brainconcent_flutter/src/features/stories/domain/entities/story.dart';
import 'package:brainconcent_flutter/src/features/stories/presentation/views/story_detail/widgets/story_detail_chapter.dart';
import 'package:flutter/material.dart';

class StoryDetailChapters extends StatelessWidget {
  const StoryDetailChapters({
    Key? key,
    required this.width,
    required this.story,
    required this.height,
  }) : super(key: key);

  final double width;
  final Story story;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(story.chapterTitles.length, (index) {
          return Column(
            children: [
              StoryDetailChapter(
                height: height,
                width: width,
                chapterTitles: story.chapterTitles[index],
                chapterDuration: story.chapterDuration[index],
                chapterVideos: story.chapterVideos[index],
              ),
              SizedBox(height: height * 2),
            ],
          );
        }),
      ],
    );
  }
}
