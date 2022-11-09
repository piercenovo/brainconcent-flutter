import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/games/domain/entities/game/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GamesDetailAppBar extends StatelessWidget {
  const GamesDetailAppBar({
    Key? key,
    required this.game,
  }) : super(key: key);

  final Game game;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    double height = SizeConfig.blockSizeV!;

    return SliverAppBar(
      expandedHeight: height * 25,
      backgroundColor: Colors.white,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          game.image,
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
      // leading: Container(
      //   color: Colors.white,
      //   child: Container(
      //     // color: Colors.red,
      //     // width: 6,
      //     // height: 6,
      //     decoration: BoxDecoration(
      //       shape: BoxShape.circle,
      //       // color: kPrimaryColor.withOpacity(0.90),
      //       color: Colors.blue,
      //     ),
      //     child: IconButton(
      //       icon: SvgPicture.asset(
      //         'assets/icons/app/bx-chevron-left.svg',
      //         color: Colors.white,
      //       ),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //     ),
      //   ),
      // ),
      // actions: [
      //   Padding(
      //     padding: EdgeInsets.symmetric(horizontal: width * 2),
      //     child: Container(
      //       decoration: BoxDecoration(
      //         shape: BoxShape.circle,
      //         color: Colors.white.withOpacity(0.20),
      //       ),
      //       child: IconButton(
      //         icon: SvgPicture.asset(
      //           'assets/icons/app/bxs-x-circle.svg',
      //           color: kPrimaryColor,
      //           width: width * 9,
      //         ),
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ),
      //   ),
      // ],
      // bottom: PreferredSize(
      //   preferredSize: const Size.fromHeight(1),
      //   child: Container(
      //     alignment: Alignment.center,
      //     height: 32.0,
      //     decoration: const BoxDecoration(
      //         color: Colors.white,
      //         borderRadius: BorderRadius.only(
      //           topLeft: Radius.circular(32.0),
      //           topRight: Radius.circular(32.0),
      //         )),
      //     child: Container(
      //       width: 40.0,
      //       height: 5.0,
      //       decoration: BoxDecoration(
      //           color: kGrayColor, borderRadius: BorderRadius.circular(100.0)),
      //     ),
      //   ),
      // ),
    );
  }
}
