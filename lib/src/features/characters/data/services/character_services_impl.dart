import 'dart:convert';

import 'package:brainconcent_flutter/src/core/env/environment_config.dart';
import 'package:brainconcent_flutter/src/features/characters/data/models/character_model.dart';
import 'package:brainconcent_flutter/src/features/characters/domain/responses/characters_response.dart';
import 'package:brainconcent_flutter/src/features/characters/domain/services/character_services.dart';
import 'package:http/http.dart' as http;

class CharacterServicesImpl implements CharacterServices {
  @override
  Future<List<CharacterModel>> getCharacters() async {
    final resp = await http.get(
        Uri.parse('${EnvironmentConfig.apiUrl}/character/get-characters'),
        headers: {'Accept': 'application/json'});

    return CharactersResponse.fromJson(jsonDecode(resp.body)).characters;
  }
}

final characterServices = CharacterServicesImpl();
