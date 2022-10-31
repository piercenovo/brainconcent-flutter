import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/widgets/text_custom.dart';
import 'package:flutter/material.dart';

void errorMessageSnack(BuildContext context, String error) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: TextCustom(
        text: error,
        color: Colors.white,
        fontSize: getProportionateScreenWidth(14)),
    backgroundColor: Colors.red,
  ));
}
