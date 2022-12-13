import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/profile/presentation/views/privacy_policy/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.blockSizeV!;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 45,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/app/bx-chevron-left.svg',
              height: height * 4,
              color: kSecondaryColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: const Body());
  }
}
