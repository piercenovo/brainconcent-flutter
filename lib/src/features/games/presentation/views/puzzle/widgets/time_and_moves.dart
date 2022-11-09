import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/core/utils/time_parser.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/controller/puzzle_controller.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/puzzle/puzzle_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeAndMoves extends StatelessWidget {
  const TimeAndMoves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final time = Provider.of<PuzzleController>(context, listen: false).time;
    final textStyle = TextStyle(
        fontSize: 20, fontWeight: FontWeight.w600, color: kSecondaryColorTwo);

    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;

    return Row(
      children: [
        ValueListenableBuilder<int>(
          valueListenable: time,
          builder: (_, time, icon) {
            return Row(
              children: [
                icon!,
                const SizedBox(width: 5),
                Text(parseTime(time), style: textStyle),
              ],
            );
          },
          child: Icon(
            PuzzleIcons.watch,
            size: 22,
            color: kSecondaryColorTwo,
          ),
        ),
        SizedBox(
          width: width * 10,
        ),
        Selector<PuzzleController, int>(
          builder: (_, moves, icon) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon!,
                const SizedBox(width: 5),
                Text(moves.toString().length > 1 ? "$moves" : "0$moves",
                    style: textStyle),
              ],
            );
          },
          selector: (_, controller) => controller.state.moves,
          child: Icon(
            Icons.multiple_stop_rounded,
            size: 22,
            color: kSecondaryColorTwo,
          ),
        ),
      ],
    );
  }
}
