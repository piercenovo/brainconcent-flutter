import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color bgColor;
  final Color textColor;
  final double fontSize;
  final VoidCallback? onPressed;

  const PrimaryButton(
      {Key? key,
      required this.text,
      required this.width,
      required this.height,
      required this.bgColor,
      required this.textColor,
      required this.fontSize,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      minWidth: width,
      color: bgColor,
      elevation: 1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: bgColor, width: 2)),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
