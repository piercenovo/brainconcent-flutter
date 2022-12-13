import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/constants.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextCustomField extends StatelessWidget {
  final String hint;
  final String icon;
  final Color fillColor;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? Function(String?) validator;
  final bool isPassword;

  const TextCustomField(
      {Key? key,
      required this.controller,
      required this.hint,
      required this.icon,
      required this.fillColor,
      this.inputType,
      this.inputAction,
      required this.focusNode,
      required this.validator,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.blockSizeV!;

    return TextFormField(
      style: focusNode.hasFocus
          ? kBodyText3.copyWith(color: kSecondaryColor)
          : kInputHintStyle,
      cursorColor: kSecondaryColor,
      keyboardType: inputType,
      textInputAction: inputAction,
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        border: kInputBorder,
        enabledBorder: kInputBorder,
        hintText: hint,
        hintStyle: kInputHintStyle,
        contentPadding: const EdgeInsets.all(0),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            height: height * 6.1,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 2,
                  color: kBackgroundColor,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SvgPicture.asset(
                icon,
                height: height * 3,
                color: focusNode.hasFocus
                    ? kPrimaryColor
                    : kSecondaryColor.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
