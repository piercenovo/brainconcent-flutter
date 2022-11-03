import 'package:brainconcent_flutter/src/features/characters/presentation/views/character_detail/widgets/body.dart';
import 'package:brainconcent_flutter/src/features/characters/domain/entities/character.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailScreen({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(character: character),
    );
  }
}
