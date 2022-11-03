import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/constants.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    double height = SizeConfig.blockSizeV!;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * 8, vertical: height * 1.4),
      child: MaterialButton(
        padding: EdgeInsets.all(getProportionateScreenWidth(17)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: kGreyColor,
        onPressed: press,
        child: Container(
          height: height * 3.2,
          padding: EdgeInsets.only(left: width * 5, right: width * 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                icon,
                color: kPrimaryColor,
                width: getProportionateScreenWidth(18),
              ),
              Text(text, maxLines: 1, style: kSettings),
              SvgPicture.asset(
                'assets/icons/app/arrow-right.svg',
                color: kPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
