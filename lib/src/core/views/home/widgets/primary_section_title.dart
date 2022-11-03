import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:flutter/material.dart';

class PrimarySectionTitle extends StatelessWidget {
  const PrimarySectionTitle({
    Key? key,
    required this.title,
    required this.press,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * 5, vertical: height * 2),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                color: acentColor,
                fontSize: height * 2.5,
                fontWeight: FontWeight.w600),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
