import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void modalLoadingShort(BuildContext context) {
  SizeConfig().init(context);
  double width = SizeConfig.blockSizeH!;

  showDialog(
      context: context,
      builder: (context) => Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 38),
            child: Lottie.asset('assets/json/loading.json'),
          ));
}
