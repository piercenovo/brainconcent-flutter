import 'package:brainconcent_flutter/src/core/error/failures.dart';
import 'package:brainconcent_flutter/src/features/games/domain/entities/game/game.dart';
import 'package:dartz/dartz.dart';

abstract class GamesRepository {
  Future<Either<Failure, List<Game>>> getAllGames();
}
