import 'package:brainconcent_flutter/src/core/strings/failures.dart';
import 'package:brainconcent_flutter/src/features/stories/data/services/story_services_impl.dart';
import 'package:brainconcent_flutter/src/features/stories/domain/entities/story.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stories_state.dart';

class StoriesCubit extends Cubit<StoriesState> {
  StoriesCubit() : super(StoriesInitial());

  Future<void> getAllStories() async {
    emit(StoriesLoading());
    try {
      final stories = await storyServices.getStories();
      emit(StoriesSuccess(stories: stories));
    } catch (e) {
      emit(const StoriesFailure(message: SERVER_FAILURE_MESSAGE));
    }
  }
}
