import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/stories/domain/entities/story.dart';
import 'package:brainconcent_flutter/src/features/stories/presentation/views/story_detail/widgets/story_detail_appbar.dart';
import 'package:brainconcent_flutter/src/features/stories/presentation/views/story_detail/widgets/story_detail_chapters.dart';
import 'package:brainconcent_flutter/src/features/stories/presentation/views/story_detail/widgets/story_detail_description.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.story,
  }) : super(key: key);

  final Story story;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    double height = SizeConfig.blockSizeV!;

    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        StoryDetailAppBar(story: story),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 6),
            child: Column(children: [
              StoryDetailDescription(
                story: story,
                height: height,
                width: width,
              ),
              SizedBox(height: height * 2),
              StoryDetailChapters(
                story: story,
                width: width,
                height: height,
              ),
              SizedBox(height: height * 4),
            ]),
          ),
        ),
      ],
    );
  }
}
