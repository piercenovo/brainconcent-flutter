import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/features/stories/domain/entities/story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoryDetailDescription extends StatelessWidget {
  const StoryDetailDescription({
    Key? key,
    required this.height,
    required this.story,
    required this.width,
  }) : super(key: key);

  final double height;
  final Story story;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 2),
        Center(
          child: Text(
            story.name,
            style: TextStyle(
                fontSize: width * 6.8,
                fontWeight: FontWeight.bold,
                color: acentColor),
          ),
        ),
        SizedBox(height: height * 1.2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIconText(
              'assets/icons/app/timer.svg',
              acentColor2,
              story.duration,
            ),
            SizedBox(width: width * 6),
            _buildIconText(
              'assets/icons/app/star.svg',
              Colors.amber,
              '4.8',
            ),
          ],
        ),
        SizedBox(height: height * 2.2),
        Text(
          'Descripción',
          style: TextStyle(
              color: acentColor,
              fontSize: width * 4.2,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: height * 1.5),
        Text(
          story.description,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: kGrayColorTwo,
            fontSize: width * 3.4,
          ),
        ),
        SizedBox(height: height * 2),
        Text(
          'Capítulos',
          style: TextStyle(
              color: acentColor,
              fontSize: width * 4.2,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildIconText(String icon, Color color, String text) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          color: color,
          width: width * 4,
        ),
        SizedBox(width: width * 0.8),
        Text(
          text,
          style: TextStyle(
            fontSize: width * 3.3,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
