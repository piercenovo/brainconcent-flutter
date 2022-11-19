import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:flutter/material.dart';

class MemoryDetails {
  String name;
  Color primarycolor;
  Color secondarycolor;
  String goto;
  int noOfstar;

  MemoryDetails({
    required this.name,
    required this.primarycolor,
    required this.secondarycolor,
    required this.noOfstar,
    required this.goto,
  });
}

List<MemoryDetails> memoryList = [
  MemoryDetails(
      name: "FÁCIL",
      primarycolor: kEasy,
      secondarycolor: kEasy,
      noOfstar: 1,
      goto: 'memoryEasy'),
  MemoryDetails(
      name: "MEDIO",
      primarycolor: kMedium,
      secondarycolor: kMedium,
      noOfstar: 2,
      goto: 'memoryMedium'),
  MemoryDetails(
      name: "DIFÍCIL",
      primarycolor: kHard,
      secondarycolor: kHard,
      noOfstar: 3,
      goto: 'memoryHard')
];

List<Widget> genrateStar(int no) {
  List<Widget> icons = [];
  for (int i = 0; i < no; i++) {
    icons.insert(
        i,
        Icon(
          Icons.star,
          color: kStar,
        ));
  }
  return icons;
}
