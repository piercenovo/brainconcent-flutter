import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/core/widgets/primary_button.dart';
import 'package:brainconcent_flutter/src/features/games/domain/entities/game/game.dart';
import 'package:flutter/material.dart';

class GameDetailStart extends StatelessWidget {
  const GameDetailStart({
    Key? key,
    required this.width,
    required this.game,
  }) : super(key: key);

  final double width;
  final Game game;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: PrimaryButton(
        height: getProportionateScreenHeight(58),
        width: getProportionateScreenWidth(310),
        text: 'Empezar',
        bgColor: kSecondaryColorTwo,
        textColor: kLightColor,
        onPressed: () {
          Navigator.pushNamed(context, game.link, arguments: {
            'uid': game.uid,
          });
        },
        fontSize: width * 4.1,
      ),
    );
  }
}
