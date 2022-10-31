import 'package:brainconcent_flutter/src/core/utils/constants.dart';
import 'package:flutter/material.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
            child: Text(
          'Página de Cuentos',
          style: kSubtitle,
        )),
      );
}
