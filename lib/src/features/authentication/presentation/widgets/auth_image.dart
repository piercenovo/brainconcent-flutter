import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class AuthImage extends StatelessWidget {
  const AuthImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Image.asset(
        image,
        height: getProportionateScreenHeight(175),
      ),
    );
  }
}
