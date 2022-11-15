import 'package:brainconcent_flutter/src/features/games/presentation/widgets/error_message.dart';
import 'package:brainconcent_flutter/src/core/helpers/loading_widget.dart';
import 'package:brainconcent_flutter/src/features/stories/presentation/cubit/stories/stories_cubit.dart';
import 'package:brainconcent_flutter/src/features/stories/presentation/views/stories/widgets/story_appbar.dart';
import 'package:brainconcent_flutter/src/features/stories/presentation/views/stories/widgets/story_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        const StoryAppBar(),
        SliverToBoxAdapter(
          child: BlocBuilder<StoriesCubit, StoriesState>(
            builder: (context, state) {
              if (state is StoriesInitial) {
                return const LoadingWidget();
              } else if (state is StoriesLoading) {
                return const LoadingWidget();
              } else if (state is StoriesSuccess) {
                final stories = state.stories;
                return StoryList(
                  stories: stories,
                );
              } else if (state is StoriesFailure) {
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
