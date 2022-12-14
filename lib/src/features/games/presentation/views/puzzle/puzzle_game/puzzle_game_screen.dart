// ignore_for_file: avoid_print

import 'dart:async';

import 'package:brainconcent_flutter/src/core/helpers/winner_dialog.dart';
import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
// import 'package:brainconcent_flutter/src/features/games/data/repositories/memory/memory_data.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/puzzle_game/controller/puzzle_controller.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/puzzle_game/controller/puzzle_state.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/puzzle_game/widgets/puzzle_buttons.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/puzzle_game/widgets/puzzle_interactor.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/puzzle_game/widgets/puzzle_options.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/puzzle_game/widgets/time_and_moves.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/game_confirm_dialog.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/puzzle/my_icon_button.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/puzzle/puzzle_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:brainconcent_flutter/src/features/games/domain/entities/puzzle/move_to.dart';

class PuzzleGameScreen extends StatefulWidget {
  final LevelP _level;
  const PuzzleGameScreen(this._level, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<PuzzleGameScreen> createState() => _PuzzleGameScreenState(_level);
}

class _PuzzleGameScreenState extends State<PuzzleGameScreen> {
  _PuzzleGameScreenState(this._level);

  void _onKeyBoardEvent(BuildContext context, RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      final moveTo = event.logicalKey.keyLabel.moveTo;
      if (moveTo != null) {
        context.read<PuzzleController>().onMoveByKeyboard(moveTo);
      }
    }
  }

  final LevelP _level;
  final controller = PuzzleController();

  @override
  void initState() {
    super.initState();
    controller.getInitialItemState(_level);

    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          controller.shuffle();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    final gameId = arguments['uid'];

    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    double height = SizeConfig.blockSizeV!;

    return ChangeNotifierProvider(
      create: (_) {
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
      child: WillPopScope(
        onWillPop: () async {
          bool willLeave = false;
          // show the confirm dialog
          await showGameConfirmDialog(context);
          return willLeave;
        },
        child: Scaffold(
          backgroundColor: lightColor2,
          body: SafeArea(
            child: Builder(
              builder: (_) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: LayoutBuilder(
                        builder: (_, constraints) {
                          return SizedBox(
                            height: height,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: height * 1,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 5,
                                        vertical: height * 1.5),
                                    child: const TimeAndMoves(),
                                  ),
                                  SizedBox(
                                    height: height * 20,
                                    child: PuzzleOptions(
                                      width: width,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: SizedBox(
                                      height: height * 41,
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
