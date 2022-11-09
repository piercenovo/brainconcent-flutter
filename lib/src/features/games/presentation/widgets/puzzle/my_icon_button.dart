import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  const MyIconButton({
    Key? key,
    required this.onPressed,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Responsive.of(context).dp(6).clamp(40, 80).toDouble();
    return MaterialButton(
      onPressed: onPressed,
      minWidth: size,
      height: size,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: Icon(
        iconData,
        color: kSecondaryColorTwo,
        size: size * 0.4,
      ),
    );
  }
}
