import 'package:brainconcent_flutter/src/features/games/presentation/widgets/game_card.dart';
import 'package:brainconcent_flutter/src/features/games/domain/entities/game.dart';
import 'package:flutter/material.dart';

class HomeGameList extends StatelessWidget {
  const HomeGameList({
    Key? key,
    required this.height,
    required this.games,
    required this.width,
  }) : super(key: key);

  final double height;
  final List<Game> games;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 2),
            child: Row(
              children: [
                ...List.generate(
                  games.length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 2.5,
                    ),
                    child: GameCard(
                        cardSize: width * 55,
                        games: games,
                        index: index,
                        height: height),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
