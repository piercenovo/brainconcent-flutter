import 'package:brainconcent_flutter/src/core/routing/app_routes.dart';
import 'package:brainconcent_flutter/src/core/routing/routes.dart';
import 'package:brainconcent_flutter/src/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brainconcent_flutter/src/injection_container.dart';
import 'features/authentication/presentation/cubit/auth/auth_cubit.dart';
import 'features/authentication/presentation/cubit/user/user_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthCubit>()..onCheckingLogin()),
        BlocProvider(create: (_) => sl<UserCubit>()),
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
