import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/features/games/domain/entities/game/game.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/game_detail/widgets/game_detail_skill.dart';
import 'package:flutter/material.dart';

class GameDetailSkills extends StatelessWidget {
  const GameDetailSkills({
    Key? key,
    required this.width,
    required this.game,
    required this.height,
  }) : super(key: key);

  final double width;
  final Game game;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kGrayColor.withOpacity(0.15),
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      width: width * 100,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(width * 3),
            child: Text('Habilidades Entrenadas',
                style: TextStyle(
                    fontSize: width * 3.8,
                    fontWeight: FontWeight.w600,
                    color: acentColor)),
          ),
          ...List.generate(game.skillsImages.length, (index) {
            return GameDetailSkill(
              height: height,
              width: width,
              skillsImages: game.skillsImages[index],
              skillTiles: game.skillsTitles[index],
            );
          }),
          SizedBox(height: height * 0.8),
        ],
      ),
    );
  }
}
