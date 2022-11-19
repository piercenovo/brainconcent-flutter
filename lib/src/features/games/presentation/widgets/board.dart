import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/constants.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';

Widget board(String title, String info) {
  double width = SizeConfig.blockSizeH!;
  double height = SizeConfig.blockSizeV!;

  return Expanded(
    child: Container(
      margin:
          EdgeInsets.only(left: width * 3, right: width * 3, top: height * 1),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration:
          BoxDecoration(color: kEasy, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(
            title,
            maxLines: 1,
            style: TextStyle(
                fontSize: width * 4.5,
                color: kLightPrimaryColor,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            info,
            maxLines: 1,
            style: TextStyle(
                fontSize: width * 6,
                color: kLightPrimaryColor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}
