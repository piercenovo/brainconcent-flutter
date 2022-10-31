import 'package:brainconcent_flutter/src/core/utils/constants.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class AuthLabels extends StatelessWidget {
  final Widget page;
  final String title;
  final String subtitle;

  const AuthLabels({
    Key? key,
    required this.page,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.blockSizeV!;

    return Column(
      children: [
        Text(title, style: kBodyText6),
        SizedBox(height: height * 1),
        GestureDetector(
          child: Text(subtitle, style: kBodyText7),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => page));
          },
        )
      ],
    );
  }
}
