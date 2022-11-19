import 'package:brainconcent_flutter/src/core/utils/time_parser.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/board.dart';
import 'package:flutter/material.dart';

class TimeAndMoves extends StatelessWidget {
  const TimeAndMoves({
    Key? key,
    required this.height,
    required this.timeGame,
    required int tries,
  })  : _tries = tries,
        super(key: key);

  final double height;
  final ValueNotifier<int> timeGame;
  final int _tries;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          board('Tiempo', parseTime(timeGame.value)),
          board('Movimientos', '$_tries')
        ],
      ),
    );
  }
}
