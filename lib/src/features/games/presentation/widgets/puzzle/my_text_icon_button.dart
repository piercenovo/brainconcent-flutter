import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/responsive.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class MyTextIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  final String label;
  final double height;
  const MyTextIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.of(context).dp(1.7);
    return TextButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          kEasy,
        ),
        fixedSize: MaterialStateProperty.all(
          Size.fromHeight(height),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: padding,
          ).copyWith(right: padding * 2),
        ),
        elevation: MaterialStateProperty.all(0),
        shadowColor: MaterialStateProperty.all(
          Colors.black45,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
      icon: icon,
      label: SizedBox(
        child: Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: SizeConfig.blockSizeH! * 4.5,
              color: kLightColor),
        ),
      ),
    );
  }
}
