import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:flutter/material.dart';

class PuzzleDetails {
  String name;
  Color primarycolor;
  Color secondarycolor;
  String goto;
  int noOfstar;

  PuzzleDetails({
    required this.name,
    required this.primarycolor,
    required this.secondarycolor,
    required this.noOfstar,
    required this.goto,
  });
}

List<PuzzleDetails> puzzleList = [
  PuzzleDetails(
      name: "FÁCIL",
      primarycolor: kEasy,
      secondarycolor: kEasy,
      noOfstar: 1,
      goto: 'puzzleEasy'),
  PuzzleDetails(
      name: "MEDIO",
      primarycolor: kMedium,
      secondarycolor: kMedium,
      noOfstar: 2,
      goto: 'puzzleMedium'),
  PuzzleDetails(
      name: "DIFÍCIL",
      primarycolor: kHard,
      secondarycolor: kHard,
      noOfstar: 3,
      goto: 'puzzleHard')
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
