import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/games/domain/entities/game.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/game_detail/widgets/game_detail_appbar.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/game_detail/widgets/game_detail_description.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/game_detail/widgets/game_detail_start.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/game_detail/widgets/game_detail_skills.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Game game;

  const Body({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    double height = SizeConfig.blockSizeV!;

    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        GamesDetailAppBar(game: game),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 6),
            child: Column(children: [
              GameDetailDescription(height: height, game: game, width: width),
              GameDetailSkills(width: width, game: game, height: height),
              SizedBox(height: height * 4.5),
              GameDetailStart(width: width),
            ]),
          ),
        ),
      ],
    );
  }
}
