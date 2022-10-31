import 'package:brainconcent_flutter/src/core/utils/constants.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class AuthTitleLabels extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthTitleLabels({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.blockSizeV!;
    return Column(
      children: [
        Text(title, style: kTitle1),
        SizedBox(height: height * 1.5),
        Text(
          subtitle,
          style: kBodyText4,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}