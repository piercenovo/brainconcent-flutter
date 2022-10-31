import 'package:flutter/material.dart';

import 'package:brainconcent_flutter/src/core/widgets/exit_alert.dart';
import 'package:brainconcent_flutter/src/core/utils/constants.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/features/authentication/data/datasources/local/onboarding_data.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/onboarding/widgets/onboarding_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  bool onLastPage = false;
  int jump = onboardingContents.length - 1;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.95).animate(_animationController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _animationController.forward();
            }
          });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.blockSizeV!;

    return WillPopScope(
        onWillPop: () async {
          final shouldPop = await showExitConfirmDialog(context);
          return shouldPop ?? false;
        },
        child: Scaffold(
            body: Stack(
          children: [
            carouselContent(height),
            OnBoardingIndicator(
              controller: _pageController,
              onLastBoardingScreen: onLastPage,
              length: onboardingContents.length,
              jump: onboardingContents.length - 1,
            ),
          ],
        )));
  }

  PageView carouselContent(double height) {
    return PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            onLastPage = (index == onboardingContents.length - 1);
          });
        },
        itemCount: onboardingContents.length,
        itemBuilder: (context, index) => Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(90)),
                Text(
                  onboardingContents[index].title,
                  style: kTitle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                AnimatedBuilder(
                    animation: _animationController,
                    builder: (_, child) => Transform.scale(
                        scale: _scaleAnimation.value,
                        child: SizedBox(
                            height: getProportionateScreenHeight(280),
                            child: Image.asset(
                              onboardingContents[index].image,
                            )))),
                SizedBox(height: getProportionateScreenHeight(25)),
                Text(
                  onboardingContents[index].subtitle,
                  style: kSubtitle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getProportionateScreenHeight(25)),
              ],
            ));
  }
}
