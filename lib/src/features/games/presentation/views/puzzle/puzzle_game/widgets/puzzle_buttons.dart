import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/responsive.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/puzzle_game/controller/puzzle_controller.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/puzzle_game/controller/puzzle_state.dart';
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
          icon: Icon(Icons.replay_rounded, color: kLightColor),
          label:
              state.status == PuzzleStatus.created ? 'REINICIAR' : 'REINICIAR',
        ),
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
