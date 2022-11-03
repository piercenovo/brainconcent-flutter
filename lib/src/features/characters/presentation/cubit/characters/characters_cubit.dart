import 'package:brainconcent_flutter/src/core/strings/failures.dart';
import 'package:brainconcent_flutter/src/features/characters/data/services/character_services_impl.dart';
import 'package:brainconcent_flutter/src/features/characters/domain/entities/character.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(CharactersInitial());

  Future<void> getAllCharacters() async {
    emit(CharactersLoading());
    try {
      final characters = await characterServices.getCharacters();
      emit(CharactersSuccess(characters: characters));
    } catch (e) {
      emit(const CharactersFailure(message: SERVER_FAILURE_MESSAGE));
    }
  }
}
