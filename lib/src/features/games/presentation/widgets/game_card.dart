import 'package:brainconcent_flutter/src/features/games/domain/entities/game/game.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/game_detail/game_detail_screen.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    Key? key,
    required this.height,
    required this.index,
    required this.games,
    required this.cardSize,
  }) : super(key: key);

  final double height;
  final int index;
  final List<Game> games;
  final double cardSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => GameDetailScreen(game: games[index]),
          ),
        );
      },
      child: SizedBox(
        width: cardSize,
        height: height * 16.6,
        child: Column(children: [
          SizedBox(height: height * 0.5),
          AspectRatio(
              aspectRatio: 1.85,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(games[index].image),
                      fit: BoxFit.cover,
                    )),
              )),
          SizedBox(height: height * 1.1),
        ]),
      ),
    );
  }
}
