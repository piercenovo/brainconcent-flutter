// ignore_for_file: unused_field

import 'package:brainconcent_flutter/src/core/helpers/winner_dialog.dart';
import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/games/data/repositories/memory/memory_data.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/memory/memory_game/widgets/start_timer.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/memory/memory_game/widgets/time_and_moves.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/game_confirm_dialog.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class MemoryGameScreen extends StatefulWidget {
  final Level _level;
  const MemoryGameScreen(this._level, {super.key});
  @override
  // ignore: no_logic_in_create_state
  MemoryGameScreenState createState() => MemoryGameScreenState(_level);
}

class MemoryGameScreenState extends State<MemoryGameScreen> {
  MemoryGameScreenState(this._level);

  int _previousIndex = -1;
  bool _flip = false;
  bool _start = false;

  bool _wait = false;
  final Level _level;
  late Timer _timer;
  late Timer _timerGame;
  late int _time = 5;
  late int _left;
  late List<String> _data;
  late int _tries = 0;
  late ValueNotifier<int> timeGame = ValueNotifier(0);

  late List<bool> _cardFlips;
  late List<GlobalKey<FlipCardState>> _cardStateKeys;

  final easy = Level.easy;

  startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (t) {
        if (mounted) {
          setState(() {
            _time = _time - 1;
          });
        }
      },
    );

    _timerGame = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (mounted) {
          Future.delayed(
            const Duration(seconds: 6),
            () {
              setState(() {
                timeGame.value++;
              });
            },
          );
        }
      },
    );
  }

  void restart() {
    startTimer();
    _data = getSourceArray(
      _level,
    );
    _cardFlips = getInitialItemState(_level);
    _cardStateKeys = getCardStateKeys(_level);
    _time = 5;
    _left = (_data.length ~/ 2);

    Future.delayed(
      const Duration(seconds: 6),
      () {
        setState(() {
          _start = true;
          _timer.cancel();
          _timerGame.cancel();
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();

    restart();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    double height = SizeConfig.blockSizeV!;

    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    final gameId = arguments['uid'];

    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        // show the confirm dialog
        await showGameConfirmDialog(context);
        return willLeave;
      },
      child: Scaffold(
        backgroundColor: lightColor2,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 5, vertical: height * 1.5),
                  child: _time > 0
                      ? StartTimer(height: height, width: width, time: _time)
                      : TimeAndMoves(
                          height: height, timeGame: timeGame, tries: _tries),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _level == Level.easy ? 2 : 3,
                    ),
                    itemBuilder: (context, index) => _start
                        ? flipCard(index, context, gameId, width)
                        : getItem(index),
                    itemCount: _data.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FlipCard flipCard(int index, BuildContext context, gameId, double width) {
    return FlipCard(
        key: _cardStateKeys[index],
        onFlip: () {
          if (!_flip) {
            _tries++;
            _flip = true;

            _previousIndex = index;
          } else {
            _flip = false;

            if (_previousIndex != index) {
              if (_data[_previousIndex] != _data[index]) {
                _wait = true;

                Future.delayed(const Duration(milliseconds: 1500), () {
                  _cardStateKeys[_previousIndex].currentState?.toggleCard();
                  _previousIndex = index;
                  _cardStateKeys[_previousIndex].currentState?.toggleCard();

                  Future.delayed(const Duration(milliseconds: 160), () {
                    setState(() {
                      _wait = false;
                    });
                  });
                });
              } else {
                _cardFlips[_previousIndex] = false;
                _cardFlips[index] = false;
                // print(_cardFlips);

                setState(() {
                  _left -= 1;
                  _tries++ * 2;
                });
                if (_cardFlips.every((t) => t == false)) {
                  // print("Won");

                  Future.delayed(const Duration(milliseconds: 160), () {
                    setState(() {
                      showWinnerDialog(
                        context,
                        time: timeGame.value,
                        moves: _tries,
                        gameId: gameId,
                      );
                      _start = false;
                    });
                  });
                }
              }
            }
          }
          setState(() {});
        },
        flipOnTouch: _wait ? false : _cardFlips[index],
        direction: FlipDirection.HORIZONTAL,
        front: Container(
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 3,
                  spreadRadius: 0.8,
                  offset: Offset(2.0, 1),
                )
              ]),
          margin:
              EdgeInsets.all(_level == Level.easy ? width * 4 : width * 2.5),
          child: Padding(
            padding: EdgeInsets.all(width * 2),
            child: Image.asset(
              "assets/images/games/box.png",
              scale: 1,
            ),
          ),
        ),
        back: getItem(index));
  }

  Widget getItem(int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 3,
              spreadRadius: 0.8,
              offset: Offset(2.0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.all(_level == Level.easy
          ? SizeConfig.blockSizeH! * 4
          : SizeConfig.blockSizeH! * 2.5),
      child: Image.asset(_data[index]),
    );
  }
}
