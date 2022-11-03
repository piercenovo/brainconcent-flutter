import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GameDetailSkill extends StatelessWidget {
  const GameDetailSkill({
    Key? key,
    required this.width,
    required this.skillTiles,
    required this.skillsImages,
    required this.height,
  }) : super(key: key);

  final double width;
  final String skillTiles;
  final String skillsImages;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width * 100,
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: kGrayColor.withOpacity(0.6)))),
        child: Padding(
          padding: EdgeInsets.only(top: width * 2, bottom: width * 2),
          child: Row(
            children: [
              SizedBox(width: width * 22),
              SvgPicture.asset(
                skillsImages,
                height: height * 3.3,
                color: kAccentColorTwo,
              ),
              SizedBox(width: width * 3),
              Text(skillTiles,
                  style: TextStyle(
                      fontSize: width * 3.3,
                      fontWeight: FontWeight.w500,
                      color: kTextColor.withOpacity(0.9))),
            ],
          ),
        ));
  }
}
