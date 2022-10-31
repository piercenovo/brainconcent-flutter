import 'package:brainconcent_flutter/src/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
            child: Text(
          'Página de Progreso',
          style: kSubtitle,
        )),
      );
}
