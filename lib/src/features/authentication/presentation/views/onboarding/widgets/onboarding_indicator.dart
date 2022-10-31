import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/constants.dart';
import 'package:brainconcent_flutter/src/core/utils/navigator.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingIndicator extends StatelessWidget {
  const OnBoardingIndicator({
    Key? key,
    required this.controller,
    required this.length,
    required this.jump,
    required this.onLastBoardingScreen,
  }) : super(key: key);

  final PageController controller;
  final bool onLastBoardingScreen;
  final int length;
  final int jump;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    return Container(
        alignment: const Alignment(0, 0.85),
        padding: EdgeInsets.symmetric(horizontal: width * 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  controller.jumpToPage(jump);
                },
                child: SizedBox(
                  width: width * 27,
                  child: Text(
                    'saltar',
                    textAlign: TextAlign.start,
                    style: kBodyText5,
                  ),
                )),
            SmoothPageIndicator(
              controller: controller,
              count: length,
              effect: WormEffect(
                activeDotColor: kSecondaryColorTwo,
                dotColor: kSecondaryColorTwo.withOpacity(0.3),
              ),
            ),
            onLastBoardingScreen
                ? GestureDetector(
                    onTap: () {
                      pushToPage(context, 'login');
                    },
                    child: SizedBox(
                        width: width * 27,
                        child: Text(
                          'empezar',
                          textAlign: TextAlign.end,
                          style: kBodyText5,
                          maxLines: 1,
                        )))
                : GestureDetector(
                    onTap: () {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    child: SizedBox(
                        width: width * 27,
                        child: Text(
                          'siguiente',
                          textAlign: TextAlign.end,
                          style: kBodyText5,
                          maxLines: 1,
                        )),
                  ),
          ],
        ));
  }
}
