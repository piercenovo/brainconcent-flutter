import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/features/games/domain/entities/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GameDetailDescription extends StatelessWidget {
  const GameDetailDescription({
    Key? key,
    required this.height,
    required this.game,
    required this.width,
  }) : super(key: key);

  final double height;
  final Game game;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 2),
        Center(
          child: Text(
            game.name,
            style: TextStyle(
                fontSize: width * 6.8,
                fontWeight: FontWeight.bold,
                color: acentColor),
          ),
        ),
        SizedBox(height: height * 1.2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIconText(
              'assets/icons/app/timer.svg',
              acentColor2,
              '4 min',
            ),
          ],
        ),
        SizedBox(height: height * 2.2),
        // Container(
        //   alignment: Alignment.center,
        //   child: Text(
        //     '¿Cómo se juega?',
        //     style: TextStyle(
        //       fontSize: width * 5.3,
        //       fontWeight: FontWeight.w700,
        //       color: kAccentColorTwo,
        //     ),
        //   ),
        // ),
        Text(
          '¿Cómo se juega?',
          style: TextStyle(
              color: acentColor,
              fontSize: width * 4,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: height * 1.8),
        Text(
          game.description,
          textAlign: TextAlign.justify,
          style: TextStyle(color: kGrayColorTwo),
        ),
        SizedBox(height: height * 1.2),
        Text(
          '¡Pulsa. en "EMPEZAR" cuando estés listo.',
          textAlign: TextAlign.justify,
          style: TextStyle(color: kGrayColorTwo),
        ),
        SizedBox(height: height * 3),
      ],
    );
  }

  Widget _buildIconText(String icon, Color color, String text) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          color: color,
          width: width * 4,
        ),
        SizedBox(
          width: width * 0.5,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: width * 3.3,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
