import 'package:brainconcent_flutter/src/core/utils/shimmer_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeStoryLoading extends StatelessWidget {
  const HomeStoryLoading({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
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
              3,
              (index) => ShimmerWidget.circular(
                  width: width * 84,
                  height: height,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
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
