import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/characters/domain/entities/character.dart';
import 'package:brainconcent_flutter/src/features/characters/presentation/views/character_detail/character_detail_screen.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    Key? key,
    required this.height,
    required this.index,
    required this.characters,
    required this.cardSize,
  }) : super(key: key);

  final double height;
  final int index;
  final List<Character> characters;
  final double cardSize;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    double height = SizeConfig.blockSizeV!;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CharacterDetailScreen(character: characters[index]),
          ),
        );
      },
      child: Image.asset(characters[index].image,
          width: width * 27, height: height * 27),
    );
  }
}
