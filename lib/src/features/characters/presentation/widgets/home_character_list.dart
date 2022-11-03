import 'package:brainconcent_flutter/src/features/characters/presentation/widgets/character_card.dart';
import 'package:brainconcent_flutter/src/features/characters/domain/entities/character.dart';
import 'package:flutter/material.dart';

class HomeCharacterList extends StatelessWidget {
  const HomeCharacterList({
    Key? key,
    required this.height,
    required this.characters,
    required this.width,
  }) : super(key: key);

  final double height;
  final List<Character> characters;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height * 14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 2),
              child: Row(
                children: [
                  ...List.generate(
                    characters.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 1,
                      ),
                      child: CharacterCard(
                          cardSize: width * 55,
                          characters: characters,
                          index: index,
                          height: height),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
