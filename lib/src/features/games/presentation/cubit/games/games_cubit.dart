import 'package:brainconcent_flutter/src/features/games/domain/usecases/get_all_games.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:brainconcent_flutter/src/features/games/domain/entities/game.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import 'package:dartz/dartz.dart';

part 'games_state.dart';

class GamesCubit extends Cubit<GamesState> {
  final GetAllGamesUsecase getAllGames;

  GamesCubit({required this.getAllGames}) : super(GamesInitial());

  Future<void> getGames() async {
    emit(GamesLoading());
    final failureOrGames = await getAllGames();
    emit(_eitherSuccessOrFailureState(failureOrGames));
  }

  Future<void> refreshGames() async {
    emit(GamesLoading());
    final failureOrGames = await getAllGames();
    emit(_eitherSuccessOrFailureState(failureOrGames));
  }

  GamesState _eitherSuccessOrFailureState(Either<Failure, List<Game>> either) {
    return either.fold(
      (failure) => GamesFailure(message: _mapFailureToMessage(failure)),
      (games) => GamesSuccess(
        games: games,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Error inesperado, inténtalo de nuevo más tarde.";
    }
  }
}
