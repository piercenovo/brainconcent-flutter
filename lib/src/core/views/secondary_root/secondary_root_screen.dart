import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/platform.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/core/views/home/home_screen.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/games/games_screen.dart';
import 'package:brainconcent_flutter/src/features/stories/presentation/views/stories/stories_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SecondaryRootScreen extends StatefulWidget {
  const SecondaryRootScreen({Key? key}) : super(key: key);

  @override
  SecondaryRootScreenState createState() => SecondaryRootScreenState();
}

class SecondaryRootScreenState extends State<SecondaryRootScreen>
    with TickerProviderStateMixin {
  int currentIndex = 0;

  final pages = [
    const HomeScreen(),
    const GamesScreen(),
    const StoriesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    double height = SizeConfig.blockSizeV!;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          IndexedStack(index: currentIndex, children: pages),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: isAndroid
          ? _buildBottomNavigatorBarAndroid(height, width)
          : _buildBottomNavigatorBarIos(height, width),
    );
  }

  Container _buildBottomNavigatorBarIos(double height, double width) =>
      Container(
        padding: EdgeInsets.only(
            left: width * 5.5, right: width * 5.5, top: height * 0.8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(color: kSecondaryColor.withOpacity(0.98))]),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          elevation: 0,
          selectedFontSize: 11,
          unselectedFontSize: 10,
          backgroundColor: Colors.transparent,
          unselectedItemColor: kGrayColor,
          selectedItemColor: kPrimaryColor,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/app/home-linear.svg',
                color: kGrayColor,
                height: height * 3.3,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/app/home-bold.svg',
                color: kPrimaryColor,
                height: height * 3.3,
              ),
              label: 'Inicio',
              backgroundColor: kSecondaryColor,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/app/game-linear.svg',
                color: kGrayColor,
                height: height * 3.3,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/app/game-bold.svg',
                color: kPrimaryColor,
                height: height * 3.3,
              ),
              label: 'Juegos',
              backgroundColor: kPrimaryColor,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/app/video-linear.svg',
                color: kGrayColor,
                height: height * 3.3,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/app/video-bold.svg',
                color: kPrimaryColor,
                height: height * 3.3,
              ),
              label: 'Cuentos',
              backgroundColor: kSecondaryColor,
            ),
          ],
        ),
      );

  Container _buildBottomNavigatorBarAndroid(double height, double width) =>
      Container(
        padding: EdgeInsets.symmetric(horizontal: width * 1.5),
        margin: EdgeInsets.only(
            bottom: height * 2.3, left: width * 4, right: width * 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(color: kSecondaryColor.withOpacity(0.98))]),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          elevation: 0,
          selectedFontSize: 11,
          unselectedFontSize: 10,
          backgroundColor: Colors.transparent,
          unselectedItemColor: kGrayColor,
          selectedItemColor: kPrimaryColor,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/app/home-linear.svg',
                color: kGrayColor,
                height: height * 3.3,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/app/home-bold.svg',
                color: kPrimaryColor,
                height: height * 3.3,
              ),
              label: 'Inicio',
              backgroundColor: kSecondaryColor,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/app/game-linear.svg',
                color: kGrayColor,
                height: height * 3.3,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/app/game-bold.svg',
                color: kPrimaryColor,
                height: height * 3.3,
              ),
              label: 'Juegos',
              backgroundColor: kPrimaryColor,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/app/video-linear.svg',
                color: kGrayColor,
                height: height * 3.3,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/app/video-bold.svg',
                color: kPrimaryColor,
                height: height * 3.3,
              ),
              label: 'Cuentos',
              backgroundColor: kSecondaryColor,
            ),
          ],
        ),
      );
}
