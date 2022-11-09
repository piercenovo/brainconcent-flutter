import 'dart:math';

import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:flutter/material.dart';

class PuzzleBackground extends StatelessWidget {
  final Widget child;
  const PuzzleBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: lightColor2,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Transform.rotate(
            angle: pi,
            child: Image.asset(
              'assets/images/puzzle/jungle.png',
              color: Colors.primaries[8].withOpacity(0.1),
            ),
          ),
        ),
        Positioned.fill(
          child: child,
        ),
      ],
    );
  }
}
