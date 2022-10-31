import 'package:brainconcent_flutter/src/core/routing/routes.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/checking_login/checking_login_screen.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/login/login_screen.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/onboarding/onboarding_screen.dart';
import 'package:brainconcent_flutter/src/core/views/root/root_screen.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/register/register_screen.dart';
import 'package:flutter/widgets.dart' show Widget, BuildContext;

Map<String, Widget Function(BuildContext)> get appRoutes => {
      // Welcome
      Routes.checkinglogin: (_) => const CheckingLoginScreen(),
      Routes.onboarding: (_) => const OnBoardingScreen(),

      // Authentication
      Routes.login: (_) => const LoginScreen(),
      Routes.register: (_) => const RegisterScreen(),

      // Root
      Routes.root: (_) => const RootScreen(),
    };
