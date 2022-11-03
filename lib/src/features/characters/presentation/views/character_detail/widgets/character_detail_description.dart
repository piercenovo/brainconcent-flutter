import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/features/characters/domain/entities/character.dart';
import 'package:flutter/material.dart';

class CharacterDetailDescription extends StatelessWidget {
  const CharacterDetailDescription({
    Key? key,
    required this.height,
    required this.character,
    required this.width,
  }) : super(key: key);

  final double height;
  final Character character;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 2),
        Center(
          child: Text(
            character.name,
            style: TextStyle(
                fontSize: width * 6.8,
                fontWeight: FontWeight.bold,
                color: acentColor),
          ),
        ),
        SizedBox(height: height * 1.2),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 1.5, horizontal: height * 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Text(
                    'Color',
                    style: TextStyle(
                        color: kSecondaryColorTwo,
                        fontSize: width * 3.4,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Favorito',
                    style: TextStyle(
                        color: kSecondaryColorTwo,
                        fontSize: width * 3.4,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: height * 1.5,
                  ),
                  Container(
                    width: width * 14,
                    height: width * 14,
                    decoration: BoxDecoration(
                        color: Color(hexColor(character.colour)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50.0))),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Edad',
                    style: TextStyle(
                        color: kSecondaryColorTwo,
                        fontSize: width * 3.4,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: height * 1.5,
                  ),
                  Container(
                    width: width * 14,
                    height: width * 14,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(character.ageImage),
                            fit: BoxFit.contain)),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'País',
                    style: TextStyle(
                        color: kSecondaryColorTwo,
                        fontSize: width * 3.4,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: height * 1.5,
                  ),
                  Container(
                    width: width * 14,
                    height: width * 14,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(character.countryImage),
                            fit: BoxFit.contain)),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Juguete',
                    style: TextStyle(
                        color: kSecondaryColorTwo,
                        fontSize: width * 3.4,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Favorito',
                    style: TextStyle(
                        color: kSecondaryColorTwo,
                        fontSize: width * 3.4,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: height * 1.5,
                  ),
                  Container(
                    width: width * 14,
                    height: width * 14,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(character.toyImage),
                            fit: BoxFit.contain)),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

int hexColor(String color) {
  String newColor = '0xff$color';

  newColor = newColor.replaceAll('#', '');

  int finalColor = int.parse(newColor);
  return finalColor;
}
