import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StartTimer extends StatelessWidget {
  const StartTimer({
    Key? key,
    required this.height,
    required this.width,
    required int time,
  })  : _time = time,
        super(key: key);

  final double height;
  final double width;
  final int _time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 12,
      alignment: Alignment.center,
      child: CircularPercentIndicator(
        animation: true,
        animationDuration: 5000,
        radius: width * 9,
        lineWidth: 10,
        percent: 1.0,
        progressColor: kEasy,
        backgroundColor: kEasy.withOpacity(0.3),
        circularStrokeCap: CircularStrokeCap.round,
        center: Text(
          '$_time',
          style: TextStyle(
            color: kEasy,
            fontWeight: FontWeight.bold,
            fontSize: width * 5.5,
          ),
        ),
      ),
    );
  }
}
