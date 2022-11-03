import 'package:brainconcent_flutter/src/features/stories/domain/entities/story.dart';
import 'package:brainconcent_flutter/src/features/stories/presentation/widgets/story_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeStoryList extends StatelessWidget {
  const HomeStoryList({
    Key? key,
    required this.height,
    required this.stories,
    required this.width,
  }) : super(key: key);

  final double height;
  final List<Story> stories;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
          height: height * 1.2,
        ),
        CarouselSlider(
          items: [
            ...List.generate(
                stories.length,
                (index) => StoryCard(
                      height: height,
                      index: index,
                      width: width,
                      stories: stories,
                    )),
          ],
          options: CarouselOptions(
            autoPlay: true,
            height: height * 26,
            enlargeCenterPage: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 900),
            scrollDirection: Axis.horizontal,
            autoPlayCurve: Curves.easeInOut,
          ),
        ),
        SizedBox(
          height: width * 2,
        ),
      ],
    );
  }
}
