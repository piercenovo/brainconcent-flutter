import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/responsive.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/controller/puzzle_controller.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/controller/puzzle_state.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/puzzle/confirm_dialog.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/puzzle/my_text_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PuzzleButtons extends StatelessWidget {
  const PuzzleButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PuzzleController>();
    final state = controller.state;
    final responsive = Responsive.of(context);
    final buttonHeight =
        responsive.dp(3).clamp(kMinInteractiveDimension, 100).toDouble();

    return Padding(
      padding: const EdgeInsets.all(18),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        MyTextIconButton(
            height: buttonHeight,
            onPressed: () => _reset(context),
            icon: Icon(Icons.replay_rounded, color: kSecondaryColorTwo),
            label:
                state.status == PuzzleStatus.created ? 'EMPEZAR' : 'Reiniciar'),
        // const SizedBox(width: 40),
        // Container(
        //   decoration: BoxDecoration(
        //     color: lightColor.withOpacity(1),
        //     borderRadius: BorderRadius.circular(30),
        //   ),
        //   child: DropdownButtonHideUnderline(
        //     child: DropdownButton<int>(
        //       itemHeight: buttonHeight,
        //       dropdownColor: (lightColor).withOpacity(0.9),
        //       borderRadius: BorderRadius.circular(30),
        //       icon: Padding(
        //         padding: const EdgeInsets.only(
        //           right: 10,
        //         ),
        //         child: Transform.rotate(
        //           angle: 90 * pi / 180,
        //           child: Icon(
        //             Icons.arrow_forward_ios_rounded,
        //             color: kSecondaryColorTwo,
        //           ),
        //         ),
        //       ),
        //       items: [3, 4, 5]
        //           .map(
        //             (e) => DropdownMenuItem(
        //                 child: Padding(
        //                   padding: const EdgeInsets.symmetric(horizontal: 5)
        //                       .copyWith(left: 15),
        //                   child: Text(
        //                     "${e}x$e",
        //                     textAlign: TextAlign.center,
        //                     style: TextStyle(
        //                       color: kSecondaryColorTwo,
        //                       fontWeight: FontWeight.w600,
        //                     ),
        //                   ),
        //                 ),
        //                 value: e),
        //           )
        //           .toList(),
        //       onChanged: (crossAxisCount) {
        //         if (crossAxisCount != null &&
        //             crossAxisCount != state.crossAxisCount) {
        //           controller.changeGrid(
        //               crossAxisCount, controller.puzzle.image);
        //         }
        //       },
        //       value: state.crossAxisCount,
        //     ),
        //   ),
        // ),
      ]),
    );
  }

  Future<void> _reset(BuildContext context) async {
    final controller = context.read<PuzzleController>();
    final state = controller.state;
    if (state.moves == 0 || state.status == PuzzleStatus.solved) {
      controller.shuffle();
    } else {
      final isOk = await showConfirmDialog(context);
      if (isOk) {
        controller.shuffle();
      }
    }
  }
}
