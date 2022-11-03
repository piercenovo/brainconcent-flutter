part of 'characters_cubit.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersSuccess extends CharactersState {
  final List<Character> characters;

  const CharactersSuccess({required this.characters});

  @override
  List<Object> get props => [characters];
}

class CharactersFailure extends CharactersState {
  final String message;

  const CharactersFailure({required this.message});

  @override
  List<Object> get props => [message];
}
