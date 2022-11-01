import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/features/games/domain/entities/game.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/game_detail/widgets/text_icon_button.dart';
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
      children: [
        SizedBox(height: height * 1.5),
        Center(
          child: Text(game.name,
              style: TextStyle(
                  fontSize: width * 6.8,
                  fontWeight: FontWeight.w400,
                  color: kSecondaryColorTwo)),
        ),
        SizedBox(height: height * 0.5),
        Container(
          alignment: Alignment.center,
          child: TextIconButton(
              height: height,
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/app/bxs-hourglass.svg',
                  height: height * 2.5, color: kAccentColorTwo),
              label: '4 minutos'),
        ),
        SizedBox(height: height * 1.5),
        Container(
          alignment: Alignment.center,
          child: Text(
            '¿Cómo se juega?',
            style: TextStyle(
              fontSize: width * 5.3,
              fontWeight: FontWeight.w700,
              color: kAccentColorTwo,
            ),
          ),
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
}
