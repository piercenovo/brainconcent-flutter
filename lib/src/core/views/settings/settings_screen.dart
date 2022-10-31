import 'package:brainconcent_flutter/src/core/utils/constants.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
            child: Text(
          'Página de Configuración',
          style: kSubtitle,
        )),
      );
}
