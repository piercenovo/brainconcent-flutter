import 'package:brainconcent_flutter/src/core/utils/shimmer_widget.dart';
import 'package:flutter/material.dart';

class HomeCharacterLoading extends StatelessWidget {
  const HomeCharacterLoading({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height * 14,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 2),
              child: Row(
                children: [
                  ...List.generate(
                    4,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 1,
                      ),
                      child: ShimmerWidget.circular(
                          width: width * 26.8,
                          height: width * 26.8,
                          shapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
