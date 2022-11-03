import 'package:brainconcent_flutter/src/features/games/presentation/widgets/error_message.dart';
import 'package:brainconcent_flutter/src/features/games/presentation/widgets/loading_widget.dart';
import 'package:brainconcent_flutter/src/features/stories/presentation/cubit/stories/stories_cubit.dart';
import 'package:brainconcent_flutter/src/features/stories/presentation/widgets/home_story_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeStory extends StatelessWidget {
  const HomeStory({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoriesCubit, StoriesState>(
      builder: (context, state) {
        if (state is StoriesInitial) {
          return const LoadingWidget();
        } else if (state is StoriesLoading) {
          return const LoadingWidget();
        } else if (state is StoriesSuccess) {
          final stories = state.stories;
          return HomeStoryList(
            height: height,
            stories: stories,
            width: width,
          );
        } else if (state is StoriesFailure) {
          return ErrorMessage(
            message: state.message,
          );
        }
        return const LoadingWidget();
      },
    );
  }
}
