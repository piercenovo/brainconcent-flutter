import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/core/utils/time_parser.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/puzzle_game/controller/puzzle_controller.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeAndMoves extends StatelessWidget {
  const TimeAndMoves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.blockSizeV!;
    final time = Provider.of<PuzzleController>(context, listen: false).time;

    return SizedBox(
      height: height * 12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueListenableBuilder<int>(
            valueListenable: time,
            builder: (_, time, icon) {
              return board('Tiempo', parseTime(time));
            },
          ),
          Selector<PuzzleController, int>(
            builder: (_, moves, icon) {
              return board('Movimientos', moves.toString());
            },
            selector: (_, controller) => controller.state.moves,
          ),
        ],
      ),
    );
  }
}
