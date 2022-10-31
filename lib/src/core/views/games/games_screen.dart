import 'package:brainconcent_flutter/src/core/utils/constants.dart';
import 'package:flutter/material.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
            child: Text(
          'Página de Juegos',
          style: kSubtitle,
        )),
      );
}
