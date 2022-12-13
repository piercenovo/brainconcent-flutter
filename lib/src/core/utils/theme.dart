import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kBackgroundColor,
    fontFamily: "OpenSans",
    textTheme: textTheme(),
    appBarTheme: appBarTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    backgroundColor: kBackgroundColor,
    elevation: 0,
    foregroundColor: kSecondaryColor,
  );
}
