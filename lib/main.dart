import 'package:brainconcent_flutter/src/app.dart';
import 'package:flutter/material.dart';
import 'package:brainconcent_flutter/src/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const App());
}
