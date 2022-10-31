import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'size_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kDefaultPadding = 20.0;

final kTitle = TextStyle(
    fontSize: getProportionateScreenHeight(38),
    color: kPrimaryColor,
    fontWeight: FontWeight.w500);

final kTitle1 = TextStyle(
    fontSize: SizeConfig.blockSizeH! * 7.8,
    color: kPrimaryColor,
    fontWeight: FontWeight.bold);

final kSubtitle = TextStyle(
  color: kPrimaryColor,
  fontSize: getProportionateScreenHeight(17),
  fontWeight: FontWeight.normal,
);

final kBodyText1 = TextStyle(
  color: kPrimaryColor,
  fontSize: SizeConfig.blockSizeH! * 4.1,
  fontWeight: FontWeight.bold,
);

final kBodyText2 = TextStyle(
  color: kSecondaryColor,
  fontSize: SizeConfig.blockSizeH! * 4.1,
  fontWeight: FontWeight.bold,
);

final kBodyText3 = TextStyle(
    color: kSecondaryColor,
    fontSize: SizeConfig.blockSizeH! * 4.1,
    fontWeight: FontWeight.normal);

final kBodyText4 = TextStyle(
  color: kPrimaryColor,
  fontSize: SizeConfig.blockSizeH! * 4.1,
  fontWeight: FontWeight.normal,
);

final kBodyText5 = TextStyle(
  fontSize: getProportionateScreenWidth(11.7),
  fontWeight: FontWeight.w600,
  color: kSecondaryColorTwo,
);

final kBodyText6 = TextStyle(
  fontSize: getProportionateScreenWidth(12.5),
  fontWeight: FontWeight.w700,
  color: kPrimaryColor,
);

final kBodyText7 = TextStyle(
  fontSize: getProportionateScreenWidth(13),
  fontWeight: FontWeight.bold,
  color: kSecondaryColorTwo,
  decorationColor: kSecondaryColorTwo,
);

final kSettings = TextStyle(
  fontSize: getProportionateScreenWidth(12.5),
  fontWeight: FontWeight.w600,
  color: kSecondaryColor,
  decorationColor: kSecondaryColor,
);

final kInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: BorderSide.none,
);

final kInputHintStyle = kBodyText2.copyWith(
  fontWeight: FontWeight.normal,
  color: kSecondaryColor.withOpacity(0.5),
);

// ----------------------

const kSpacingUnit = 10;

const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColorr = Color(0xFFFFC107);

final kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
  fontWeight: FontWeight.w600,
);

final kCaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
  fontWeight: FontWeight.w100,
);

final kButtonTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
  fontWeight: FontWeight.w400,
  color: kDarkPrimaryColor,
);

final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'SFProText',
  primaryColor: kDarkPrimaryColor,
  canvasColor: kDarkPrimaryColor,
  backgroundColor: kDarkSecondaryColor,
  // accentColor: kAccentColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
        color: kLightSecondaryColor,
      ),
  textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: kLightSecondaryColor,
        displayColor: kLightSecondaryColor,
      ),
);

final kLightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'SFProText',
  primaryColor: kLightPrimaryColor,
  canvasColor: kLightPrimaryColor,
  backgroundColor: kLightSecondaryColor,
  // accentColor: kAccentColor,
  iconTheme: ThemeData.light().iconTheme.copyWith(
        color: kDarkSecondaryColor,
      ),
  textTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: kDarkSecondaryColor,
        displayColor: kDarkSecondaryColor,
      ),
);
