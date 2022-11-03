import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/characters/presentation/widgets/home_characters.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/home_games.dart';
import 'package:brainconcent_flutter/src/core/views/home/widgets/primary_section_title.dart';
import 'package:brainconcent_flutter/src/features/stories/presentation/widgets/home_story.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    double height = SizeConfig.blockSizeV!;

    return SingleChildScrollView(
        child: Stack(children: [
      HomeStory(height: height, width: width),
      SizedBox(height: height * 4),
      Container(
        constraints: BoxConstraints(minHeight: height * 70),
        margin: EdgeInsets.only(top: height * 31.1),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Column(
          children: [
            PrimarySectionTitle(
              width: width,
              height: height,
              title: 'Personajes',
              press: () {},
            ),
            HomeCharacters(height: height, width: width),
            PrimarySectionTitle(
              width: width,
              height: height,
              title: 'Juegos',
              press: () {},
            ),
            HomeGames(height: height, width: width),
            SizedBox(height: getProportionateScreenHeight(100)),
          ],
        ),
      )
    ]));
  }
}
