import 'package:brainconcent_flutter/src/core/utils/shimmer_widget.dart';
import 'package:flutter/material.dart';

class HomeGameLoading extends StatelessWidget {
  const HomeGameLoading({
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 2),
            child: Row(
              children: [
                ...List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 2.5,
                    ),
                    child: ShimmerWidget.circular(
                        width: width * 55,
                        height: height * 16,
                        shapeBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
