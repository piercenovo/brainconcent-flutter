// ignore_for_file: avoid_print

import 'dart:async';

import 'package:brainconcent_flutter/src/core/helpers/winner_dialog.dart';
import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/responsive.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/controller/puzzle_controller.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/widgets/puzzle_buttons.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/widgets/puzzle_interactor.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/widgets/puzzle_options.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/widgets/time_and_moves.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/game_confirm_dialog.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/puzzle/my_icon_button.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/puzzle/puzzle_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:brainconcent_flutter/src/features/games/domain/entities/puzzle/move_to.dart';

class PuzzleGameScreen extends StatelessWidget {
  const PuzzleGameScreen({
    Key? key,
  }) : super(key: key);

  void _onKeyBoardEvent(BuildContext context, RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      final moveTo = event.logicalKey.keyLabel.moveTo;
      if (moveTo != null) {
        context.read<PuzzleController>().onMoveByKeyboard(moveTo);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    final gameId = arguments['uid'];

    SizeConfig().init(context);
    double height = SizeConfig.blockSizeV!;

    final responsive = Responsive.of(context);
    final width = responsive.width;
    return ChangeNotifierProvider(
      create: (_) {
        final controller = PuzzleController();
        controller.onFinish.listen(
          (_) {
            Timer(
              const Duration(
                milliseconds: 200,
              ),
              () {
                showWinnerDialog(
                  context,
                  time: controller.time.value,
                  moves: controller.state.moves,
                  gameId: gameId,
                );
              },
            );
          },
        );
        return controller;
      },
      builder: (context, child) => RawKeyboardListener(
        autofocus: true,
        includeSemantics: false,
        focusNode: FocusNode(),
        onKey: (event) => _onKeyBoardEvent(context, event),
        child: child!,
      ),
      child: Scaffold(
        backgroundColor: lightColor2,
        body: SafeArea(
          child: OrientationBuilder(
            builder: (_, orientation) {
              final isPortrait = orientation == Orientation.portrait;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildAppBar(height, context),
                  SizedBox(height: height * 1.5),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (_, constraints) {
                        final height = constraints.maxHeight;
                        final puzzleHeight =
                            (isPortrait ? height * 0.45 : height * 0.5)
                                .clamp(250, 700)
                                .toDouble();
                        final optionsHeight =
                            (isPortrait ? height * 0.25 : height * 0.2)
                                .clamp(120, 200)
                                .toDouble();

                        return SizedBox(
                          height: height,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: optionsHeight,
                                  child: PuzzleOptions(
                                    width: width,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.04,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: SizedBox(
                                    height: puzzleHeight,
                                    child: const AspectRatio(
                                      aspectRatio: 1,
                                      child: PuzzleInteractor(),
                                    ),
                                  ),
                                ),
                                const PuzzleButtons(),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

SafeArea buildAppBar(double height, BuildContext context) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: SvgPicture.asset(
                'assets/icons/app/angle-left.svg',
                color: kSecondaryColorTwo,
                height: height * 2.8,
              ),
              onPressed: () {
                showGameConfirmDialog(context);
              }),
          const TimeAndMoves(),
          Consumer<PuzzleController>(
            builder: (_, controller, __) => Row(
              children: [
                const SizedBox(width: 10),
                MyIconButton(
                  onPressed: controller.toggleSound,
                  iconData: controller.state.sound
                      ? PuzzleIcons.sound
                      : PuzzleIcons.mute,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
