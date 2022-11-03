import 'package:brainconcent_flutter/src/core/network/network_info.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/cubit/auth/auth_cubit.dart';
import 'package:brainconcent_flutter/src/features/authentication/presentation/cubit/user/user_cubit.dart';
import 'package:brainconcent_flutter/src/features/games/data/datasources/local/cached_game_data_source.dart';
import 'package:brainconcent_flutter/src/features/games/data/datasources/local/game_local_data_source.dart';
import 'package:brainconcent_flutter/src/features/games/data/datasources/remote/game_remote_data_source.dart';
import 'package:brainconcent_flutter/src/features/games/data/datasources/remote/http_game_data_source.dart';
import 'package:brainconcent_flutter/src/features/games/data/repositories/games_repository_impl.dart';
import 'package:brainconcent_flutter/src/features/games/domain/repositories/games_repository.dart';
import 'package:brainconcent_flutter/src/features/games/domain/usecases/get_all_games.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/cubit/games/games_cubit.dart';
import 'package:brainconcent_flutter/src/features/stories/presentation/cubit/stories/stories_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
//! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());

// ! Features - games
// Cubit
  sl.registerFactory(() => GamesCubit(getAllGames: sl()));

// Usecases
  sl.registerLazySingleton(() => GetAllGamesUsecase(sl()));

// Repository
  sl.registerLazySingleton<GamesRepository>(() => GamesRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

// Datasources
  sl.registerLazySingleton<GameRemoteDataSource>(
      () => HttpGameDataSource(client: sl()));
  sl.registerLazySingleton<GameLocalDataSource>(
      () => CachedGameDataSource(sharedPreferences: sl()));

// ! Features - authentication
// Bloc
  sl.registerFactory(() => AuthCubit());
  sl.registerFactory(() => UserCubit());

// ! Features - stories
// Bloc
  sl.registerFactory(() => StoriesCubit());
}
