import 'package:brainconcent_flutter/src/core/helpers/modal_loading_short.dart';
import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/time_parser.dart';
import 'package:brainconcent_flutter/src/core/widgets/up_to_down.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/cubit/user/user_cubit.dart';
import 'package:brainconcent_flutter/src/features/games/data/services/game_score_services_impl.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/puzzle/puzzle_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

Future<void> showWinnerDialog(
  BuildContext context, {
  required int time,
  required int moves,
  required String gameId,
}) {
  return showDialog(
    context: context,
    builder: (_) => WinnerDialog(
      time: time,
      moves: moves,
      gameId: gameId,
    ),
  );
}

class WinnerDialog extends StatelessWidget {
  final int time;
  final int moves;
  final String gameId;
  const WinnerDialog({
    Key? key,
    required this.time,
    required this.moves,
    required this.gameId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: UpToDown(
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: lightColor,
          child: SizedBox(
            width: 340,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: 1.2,
                  child: Stack(
                    children: [
                      const Center(
                        child: RiveAnimation.asset(
                          'assets/rive/winner.riv',
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                "!BUEN TRABAJO!",
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Has completado la partida",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    PuzzleIcons.watch,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    parseTime(time),
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.multiple_stop_rounded,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    "$moves",
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 0.6,
                  color: Colors.black12,
                ),
                SizedBox(
                  width: double.infinity,
                  child: BlocBuilder<UserCubit, UserState>(
                      builder: (context, state) => TextButton(
                            onPressed: () async {
                              modalLoadingShort(context);

                              await gameScoreServices.createGameScore(
                                time.toString(),
                                moves.toString(),
                                state.user!.uid,
                                gameId,
                              );
                              // ignore: use_build_context_synchronously
                              Navigator.of(context)
                                ..pop()
                                ..pop()
                                ..pop();
                            },
                            child: const Text(
                              "ACEPTAR",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
