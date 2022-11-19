import 'package:brainconcent_flutter/src/core/routing/routes.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/checking_login/checking_login_screen.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/login/login_screen.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/onboarding/onboarding_screen.dart';
import 'package:brainconcent_flutter/src/core/views/root/root_screen.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/views/register/register_screen.dart';
import 'package:brainconcent_flutter/src/features/games/data/repositories/memory/memory_data.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/games/games_screen.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/memory/memory_game/memory_game_screen.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/memory/memory_levels/memory_levels_screen.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/puzzle_game/controller/puzzle_state.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/puzzle_game/puzzle_game_screen.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/puzzle/puzzle_levels/puzzle_levels_screen.dart';
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

      // Games
      Routes.games: (_) => const GamesScreen(),
      // Routes.puzzleOptions: (_) => const PuzzleOptionsScreen(),

      // Routes.puzzleGame: (_) => const PuzzleGameScreen(),

      Routes.puzzleGame: (_) => const PuzzleLevelsScreen(),
      Routes.puzzleGameEasy: (_) => const PuzzleGameScreen(LevelP.easy),
      Routes.puzzleGameMedium: (_) => const PuzzleGameScreen(LevelP.medium),
      Routes.puzzleGameHard: (_) => const PuzzleGameScreen(LevelP.hard),

      Routes.memoryGame: (_) => const MemoryLevelsScreen(),
      Routes.memoryGameEasy: (_) => const MemoryGameScreen(Level.easy),
      Routes.memoryGameMedium: (_) => const MemoryGameScreen(Level.medium),
      Routes.memoryGameHard: (_) => const MemoryGameScreen(Level.hard),
    };
