import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/games/domain/entities/game/game.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/game_detail/game_detail_screen.dart';
import 'package:flutter/material.dart';

class GameList extends StatelessWidget {
  const GameList({
    Key? key,
    required this.games,
  }) : super(key: key);

  final List<Game> games;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    double height = SizeConfig.blockSizeV!;

    return Column(children: [
      ...List.generate(
        games.length,
        (index) => buildGameCard(width, height, index, context),
      ),
      SizedBox(height: height * 11),
    ]);
  }

  GestureDetector buildGameCard(
      double width, double height, int index, BuildContext context) {
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
        width: width * 85,
        child: Column(children: [
          SizedBox(height: height * 1.5),
          AspectRatio(
            aspectRatio: 1.85,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(games[index].image), fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(height: height * 1),
        ]),
      ),
    );
  }
}
