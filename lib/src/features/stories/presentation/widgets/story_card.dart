import 'package:brainconcent_flutter/src/features/stories/domain/entities/story.dart';
import 'package:brainconcent_flutter/src/features/stories/presentation/views/story_detail/story_detail_screen.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    Key? key,
    required this.stories,
    required this.width,
    required this.height,
    required this.index,
  }) : super(key: key);

  final List<Story> stories;
  final double width;
  final double height;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    StoryDetailScreen(story: stories[index])));
      },
      child: Container(
        width: width * 85,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
                image: AssetImage(stories[index].image), fit: BoxFit.cover)),
      ),
    );
  }
}
