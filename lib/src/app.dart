import 'package:brainconcent_flutter/src/core/routing/app_routes.dart';
import 'package:brainconcent_flutter/src/core/routing/routes.dart';
import 'package:brainconcent_flutter/src/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brainconcent_flutter/src/injection_container.dart';
import 'features/authentication/presentation/cubit/auth/auth_cubit.dart';
import 'features/authentication/presentation/cubit/user/user_cubit.dart';
import 'features/games/presentation/cubit/games/games_cubit.dart';
import 'features/characters/presentation/cubit/characters/characters_cubit.dart';
import 'features/stories/presentation/cubit/stories/stories_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthCubit>()..onCheckingLogin()),
        BlocProvider(create: (_) => sl<UserCubit>()),
        BlocProvider(create: (_) => sl<GamesCubit>()..getGames()),
        BlocProvider(create: (_) => sl<StoriesCubit>()..getAllStories()),
        BlocProvider(create: (_) => sl<CharactersCubit>()..getAllCharacters()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Brainconcent',
        theme: theme(),
        initialRoute: Routes.checkinglogin,
        routes: appRoutes,
      ),
    );
  }
}
