import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/stories/domain/entities/story.dart';
import 'package:brainconcent_flutter/src/features/stories/presentation/views/story_detail/story_detail_screen.dart';
import 'package:flutter/material.dart';

class StoryList extends StatelessWidget {
  const StoryList({
    Key? key,
    required this.stories,
  }) : super(key: key);

  final List<Story> stories;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    double height = SizeConfig.blockSizeV!;

    return Column(children: [
      ...List.generate(
        stories.length,
        (index) => buildGameCard(
          width,
          height,
          index,
          context,
        ),
      ),
      SizedBox(height: height * 11),
    ]);
  }

  GestureDetector buildGameCard(
      double width, double height, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => StoryDetailScreen(story: stories[index]),
          ),
        );
      },
      child: SizedBox(
        width: width * 85,
        child: Column(children: [
          SizedBox(height: height * 1.5),
          AspectRatio(
              aspectRatio: 1.85,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(stories[index].image),
                        fit: BoxFit.cover)),
              )),
          SizedBox(height: height * 1),
        ]),
      ),
    );
  }
}
