import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/characters/domain/entities/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CharacterDetailAppBar extends StatelessWidget {
  const CharacterDetailAppBar({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    double height = SizeConfig.blockSizeV!;

    return SliverAppBar(
      expandedHeight: height * 37,
      backgroundColor: Colors.white,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          character.detailImage,
          fit: BoxFit.cover,
        ),
        stretchModes: const [StretchMode.zoomBackground],
      ),
      leading: Padding(
        padding: EdgeInsets.only(left: width * 4),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kSecondaryColorTwo.withOpacity(0.95),
          ),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/app/bx-chevron-left.svg',
              color: Colors.white,
              width: width * 8,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
