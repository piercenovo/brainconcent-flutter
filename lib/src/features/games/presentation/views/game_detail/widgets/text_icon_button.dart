import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class TextIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  final String label;
  final double height;
  const TextIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.of(context).dp(1.2);
    return TextButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          lightColor.withOpacity(0.8),
        ),
        fixedSize: MaterialStateProperty.all(
          Size.fromHeight(height),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: padding,
          ).copyWith(right: padding * 1.5),
        ),
        elevation: MaterialStateProperty.all(0),
        shadowColor: MaterialStateProperty.all(
          Colors.black38,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      icon: icon,
      label: Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: darkColor,
            fontSize: Responsive.of(context).dp(1.4)),
      ),
    );
  }
}
