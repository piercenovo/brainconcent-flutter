import 'package:brainconcent_flutter/src/features/games/domain/entities/puzzle/position.dart';
import 'package:equatable/equatable.dart';

class Tile extends Equatable {
  final int value;
  final Position position;
  final Position correctPosition;

  const Tile(
      {required this.value,
      required this.position,
      required this.correctPosition});

  Tile move(Position newPosition) {
    return Tile(
        value: value, correctPosition: correctPosition, position: newPosition);
  }

  @override
  List<Object?> get props => [value, correctPosition, position];
}
