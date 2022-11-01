import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:brainconcent_flutter/src/core/widgets/up_to_down.dart';
import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:flutter/material.dart';

Future<bool> showGameConfirmDialog(BuildContext context) async {
  SizeConfig().init(context);
  double width = SizeConfig.blockSizeH!;
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
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    child: Transform.scale(
                      scale: 1.3,
                      child: Image.asset(
                        'assets/img/puzzle/brainy.png',
                        width: 110,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '¿Estás seguro?',
                    style: TextStyle(
                      fontSize: width * 5,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      'Realmente quieres salir del juego actual',
                      style: TextStyle(
                        fontSize: width * 3.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context)
                              ..pop()
                              ..pop();
                          },
                          child: const Text('SI'),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 1,
                        color: (darkColor).withOpacity(0.2),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('NO'),
                        ),
                      ),
                    ],
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
