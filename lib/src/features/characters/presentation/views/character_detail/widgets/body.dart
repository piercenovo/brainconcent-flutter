import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/characters/domain/entities/character.dart';
import 'package:brainconcent_flutter/src/features/characters/presentation/views/character_detail/widgets/character_detail_appbar.dart';
import 'package:brainconcent_flutter/src/features/characters/presentation/views/character_detail/widgets/character_detail_description.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    double height = SizeConfig.blockSizeV!;

    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        CharacterDetailAppBar(character: character),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 6),
            child: Column(children: [
              CharacterDetailDescription(
                character: character,
                height: height,
                width: width,
              ),
              SizedBox(height: height * 1.5),
              Text(
                character.story,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: width * 3.8,
                    color: kGrayColorTwo,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: height * 6.5),
            ]),
          ),
        ),
      ],
    );
  }
}
