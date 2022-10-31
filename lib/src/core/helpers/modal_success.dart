import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/core/widgets/up_to_down.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future<bool> modalSuccess(BuildContext context, String text,
    {required VoidCallback onPressed}) async {
  SizeConfig().init(context);
  double width = SizeConfig.blockSizeH!;
  double height = SizeConfig.blockSizeV!;

  final result = await showDialog<bool>(
    context: context,
    builder: (context) {
      return Center(
        child: UpToDown(
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: lightColor,
            child: SizedBox(
              width: 320,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: height * 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 1),
                    child: Text(
                      text,
                      style: TextStyle(
                          fontSize: width * 4.5,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Lottie.asset(
                    'assets/json/done-2.json',
                    height: height * 20,
                    width: width * 50,
                  ),
                  Container(
                    height: 0.7,
                    color: Colors.black12,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: onPressed,
                      child: Text(
                        "HECHO",
                        style: TextStyle(
                            fontSize: width * 3.8,
                            color: acentColor2,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
  return result ?? false;
}
