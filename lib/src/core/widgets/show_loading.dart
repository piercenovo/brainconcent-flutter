import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future<bool> showLoading(BuildContext context) async {
  final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(getProportionateScreenHeight(120)),
          child: Center(
              child: Lottie.network(
                  'https://assets7.lottiefiles.com/packages/lf20_a2chheio.json')),
        );
      });
  return result ?? false;
}
