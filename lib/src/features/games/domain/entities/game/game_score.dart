import 'package:equatable/equatable.dart';

class GameScore extends Equatable {
  final int time;
  final int tap;
  final DateTime date;
  final String userId;
  final String gameId;
  final String uid;

  const GameScore({
    required this.time,
    required this.tap,
    required this.date,
    required this.userId,
    required this.gameId,
    required this.uid,
  });

  @override
  List<Object?> get props => [
        time,
        tap,
        date,
        userId,
        gameId,
        uid,
      ];
}
