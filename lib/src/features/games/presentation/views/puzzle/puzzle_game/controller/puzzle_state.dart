import 'package:brainconcent_flutter/src/features/games/domain/entities/puzzle/puzzle.dart';
import 'package:equatable/equatable.dart';

enum PuzzleStatus { created, playing, solved }

enum LevelP { hard, medium, easy }

class PuzzleState extends Equatable {
  final int crossAxisCount;
  final Puzzle puzzle;
  final bool solved;
  final int moves;
  final PuzzleStatus status;
  final bool sound;

  const PuzzleState({
    required this.crossAxisCount,
    required this.puzzle,
    required this.solved,
    required this.moves,
    required this.status,
    required this.sound,
  }) : assert(crossAxisCount >= 3);

  PuzzleState copyWith({
    int? crossAxisCount,
    Puzzle? puzzle,
    bool? solved,
    int? moves,
    PuzzleStatus? status,
    bool? sound,
  }) {
    return PuzzleState(
      crossAxisCount: crossAxisCount ?? this.crossAxisCount,
      puzzle: puzzle ?? this.puzzle,
      solved: solved ?? this.solved,
      moves: moves ?? this.moves,
      status: status ?? this.status,
      sound: sound ?? this.sound,
    );
  }

  @override
  List<Object?> get props =>
      [crossAxisCount, puzzle, solved, moves, status, sound];
}
