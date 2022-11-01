import 'package:brainconcent_flutter/src/features/games/domain/entities/game.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/game_detail/widgets/body.dart';
import 'package:flutter/material.dart';

class GameDetailScreen extends StatelessWidget {
  final Game game;
  const GameDetailScreen({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(game: game),
    );
  }
}
