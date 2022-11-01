import 'package:brainconcent_flutter/src/features/games/presentation/cubit/games/games_cubit.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/games/widgets/game_list.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/views/games/widgets/games_appbar.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/error_message.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        const GamesAppBar(),
        SliverToBoxAdapter(
          child: BlocBuilder<GamesCubit, GamesState>(
            builder: (context, state) {
              if (state is GamesInitial) {
                return const LoadingWidget();
              } else if (state is GamesLoading) {
                return const LoadingWidget();
              } else if (state is GamesSuccess) {
                final games = state.games;
                return GameList(
                  games: games,
                );
              } else if (state is GamesFailure) {
                return ErrorMessage(
                  message: state.message,
                );
              }
              return const LoadingWidget();
            },
          ),
        ),
      ],
    );
  }
}
