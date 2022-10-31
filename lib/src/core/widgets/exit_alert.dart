import 'package:brainconcent_flutter/src/core/widgets/up_to_down.dart';
import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<bool?> showExitConfirmDialog(BuildContext context) async {
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
                        height: getProportionateScreenHeight(50),
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Text(
                    '¿Deseas Salir de la Aplicación?',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(5)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            SystemNavigator.pop();
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

  // if (Platform.isAndroid) {
  //   return showDialog(
  //       context: context,
  //       builder: (_) => AlertDialog(
  //             backgroundColor: kBackgroundColor,
  //             title: Text(
  //               '¿Deseas Salir de la App Brainconcent?',
  //               style: TextStyle(color: kSecondaryColor),
  //             ),
  //             actions: <Widget>[
  //               MaterialButton(
  //                 child: Text('No',
  //                     style: TextStyle(
  //                         color: kSecondaryColor, fontWeight: FontWeight.w600)),
  //                 onPressed: () => Navigator.pop(context, false),
  //               ),
  //               MaterialButton(
  //                 child: Text('Sí',
  //                     style: TextStyle(
  //                         color: kSecondaryColor, fontWeight: FontWeight.w600)),
  //                 onPressed: () => SystemNavigator.pop(),
  //               )
  //             ],
  //           ));
  // }

  // showCupertinoDialog(
  //     context: context,
  //     builder: (_) => CupertinoAlertDialog(
  //           title: const Text('¿Deseas Salir de la App Brainconcent?'),
  //           actions: <Widget>[
  //             CupertinoDialogAction(
  //               child: const Text('No'),
  //               onPressed: () => Navigator.pop(context),
  //             ),
  //             CupertinoDialogAction(
  //               child: const Text('Sí'),
  //               onPressed: () => Navigator.pop(context),
  //             )
  //           ],
  //         ));
  // return null;
}
