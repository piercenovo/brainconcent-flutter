import 'package:brainconcent_flutter/src/core/error/exceptions.dart';
import 'package:brainconcent_flutter/src/core/error/failures.dart';
import 'package:brainconcent_flutter/src/core/network/network_info.dart';
import 'package:brainconcent_flutter/src/features/games/data/datasources/local/game_local_data_source.dart';
import 'package:brainconcent_flutter/src/features/games/data/datasources/remote/game_remote_data_source.dart';
import 'package:brainconcent_flutter/src/features/games/domain/entities/game.dart';
import 'package:brainconcent_flutter/src/features/games/domain/repositories/games_repository.dart';
import 'package:dartz/dartz.dart';

class FakeRepositoryImpl implements GamesRepository {
  final GameRemoteDataSource remoteDataSource;
  final GameLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  FakeRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<Game>>> getAllGames() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.getAllGames();
        return Left(ServerFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        await localDataSource.getCachedGames();
        return Left(EmptyCacheFailure());
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
