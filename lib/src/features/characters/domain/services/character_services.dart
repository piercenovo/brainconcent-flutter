import 'package:brainconcent_flutter/src/features/characters/data/models/character_model.dart';

abstract class CharacterServices {
  Future<List<CharacterModel>> getCharacters();
}
