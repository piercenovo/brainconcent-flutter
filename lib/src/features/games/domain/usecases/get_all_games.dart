import 'package:brainconcent_flutter/src/features/games/domain/entities/game/game.dart';
import 'package:brainconcent_flutter/src/features/games/domain/repositories/games/games_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

class GetAllGamesUsecase {
  final GamesRepository repository;

  GetAllGamesUsecase(this.repository);

  Future<Either<Failure, List<Game>>> call() async {
    return await repository.getAllGames();
  }
}
