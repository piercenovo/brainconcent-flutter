import 'package:brainconcent_flutter/src/core/routing/routes.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/onboarding/onboarding_screen.dart';
import 'package:flutter/widgets.dart' show Widget, BuildContext;

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.onboarding: (_) => const OnBoardingScreen(),
    };
