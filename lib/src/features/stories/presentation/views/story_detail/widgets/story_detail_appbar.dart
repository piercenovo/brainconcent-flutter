import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/stories/domain/entities/story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StoryDetailAppBar extends StatelessWidget {
  const StoryDetailAppBar({
    Key? key,
    required this.story,
  }) : super(key: key);

  final Story story;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    double height = SizeConfig.blockSizeV!;

    return SliverAppBar(
      expandedHeight: height * 25,
      backgroundColor: Colors.white,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          story.image,
          fit: BoxFit.cover,
        ),
        stretchModes: const [StretchMode.zoomBackground],
      ),
      leading: Padding(
        padding: EdgeInsets.only(left: width * 4),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kSecondaryColorTwo.withOpacity(0.95),
          ),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/app/bx-chevron-left.svg',
              color: Colors.white,
              width: width * 8,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
