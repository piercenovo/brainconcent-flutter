import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/features/stories/presentation/views/story_detail/widgets/chapter_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoryDetailChapter extends StatelessWidget {
  const StoryDetailChapter({
    Key? key,
    required this.width,
    required this.chapterTitles,
    required this.chapterDuration,
    required this.chapterVideos,
    required this.height,
  }) : super(key: key);

  final double width;
  final String chapterTitles;
  final String chapterDuration;
  final String chapterVideos;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChapterVideoPlayer(
                    chapterVideos: chapterVideos,
                  )),
        );
      },
      child: Container(
          height: height * 13,
          decoration: BoxDecoration(
            color: lightColor2,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 3, vertical: height * 1.5),
            child: Row(
              children: [
                SizedBox(
                  width: width * 20,
                  height: width * 20,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/app/play-bold.svg',
                      color: kSecondaryColorTwo.withOpacity(0.9),
                      width: width * 100,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChapterVideoPlayer(
                                  chapterVideos: chapterVideos,
                                )),
                      );
                    },
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(
                    top: height * 2,
                    left: height * 1,
                    right: height * 1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chapterTitles,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: width * 3.6,
                            fontWeight: FontWeight.w600,
                            color: kSecondaryColorTwo.withOpacity(0.9)),
                      ),
                      SizedBox(height: height * 0.5),
                      Text(
                        chapterDuration,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: kGrayColorTwo,
                          fontSize: width * 3,
                        ),
                      ),
                    ],
                  ),
                )),
                SvgPicture.asset(
                  'assets/icons/app/arrow-right.svg',
                  color: kSecondaryColorTwo,
                ),
              ],
            ),
          )),
    );
  }
}
