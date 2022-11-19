import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

enum Level { hard, medium, easy }

List<String> fillSourceArray() {
  return [
    'assets/images/animals/lion.png',
    'assets/images/animals/lion.png',
    'assets/images/animals/fox.png',
    'assets/images/animals/fox.png',
    'assets/images/animals/koala.png',
    'assets/images/animals/koala.png',
    'assets/images/animals/monkey.png',
    'assets/images/animals/monkey.png',
    'assets/images/animals/mouse.png',
    'assets/images/animals/mouse.png',
    'assets/images/animals/panda.png',
    'assets/images/animals/panda.png',
    'assets/images/animals/penguin.png',
    'assets/images/animals/penguin.png',
    'assets/images/animals/tiger.png',
    'assets/images/animals/tiger.png',
    'assets/images/animals/dog.png',
    'assets/images/animals/dog.png',
  ];
}

List<String> getSourceArray(
  Level level,
) {
  List<String> levelAndKindList = <String>[];
  List sourceArray = fillSourceArray();
  if (level == Level.hard) {
    for (var element in sourceArray) {
      levelAndKindList.add(element);
    }
  } else if (level == Level.medium) {
    for (int i = 0; i < 12; i++) {
      levelAndKindList.add(sourceArray[i]);
    }
  } else if (level == Level.easy) {
    for (int i = 0; i < 8; i++) {
      levelAndKindList.add(sourceArray[i]);
    }
  }

  levelAndKindList.shuffle();
  return levelAndKindList;
}

List<bool> getInitialItemState(Level level) {
  List<bool> initialItemState = <bool>[];
  if (level == Level.hard) {
    for (int i = 0; i < 18; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.medium) {
    for (int i = 0; i < 12; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.easy) {
    for (int i = 0; i < 8; i++) {
      initialItemState.add(true);
    }
  }
  return initialItemState;
}

List<GlobalKey<FlipCardState>> getCardStateKeys(Level level) {
  List<GlobalKey<FlipCardState>> cardStateKeys = <GlobalKey<FlipCardState>>[];
  if (level == Level.hard) {
    for (int i = 0; i < 18; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.medium) {
    for (int i = 0; i < 12; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.easy) {
    for (int i = 0; i < 8; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  }
  return cardStateKeys;
}
