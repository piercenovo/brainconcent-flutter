part of 'games_cubit.dart';

abstract class GamesState extends Equatable {
  const GamesState();

  @override
  List<Object> get props => [];
}

class GamesInitial extends GamesState {}

class GamesLoading extends GamesState {}

class GamesSuccess extends GamesState {
  final List<Game> games;

  const GamesSuccess({required this.games});

  @override
  List<Object> get props => [games];
}

class GamesFailure extends GamesState {
  final String message;

  const GamesFailure({required this.message});

  @override
  List<Object> get props => [message];
}
