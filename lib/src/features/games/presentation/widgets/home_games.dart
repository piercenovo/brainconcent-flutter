import 'package:brainconcent_flutter/src/features/games/presentation/widgets/home_game_list.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/cubit/games/games_cubit.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/error_message.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/home_game_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeGames extends StatelessWidget {
  const HomeGames({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamesCubit, GamesState>(
      builder: (context, state) {
        if (state is GamesInitial) {
          return HomeGameLoading(height: height, width: width);
        } else if (state is GamesLoading) {
          return HomeGameLoading(height: height, width: width);
        } else if (state is GamesSuccess) {
          final games = state.games;
          return HomeGameList(
            height: height,
            games: games,
            width: width,
          );
        } else if (state is GamesFailure) {
          return ErrorMessage(
            message: state.message,
          );
        }
        return HomeGameLoading(height: height, width: width);
      },
    );
  }
}
