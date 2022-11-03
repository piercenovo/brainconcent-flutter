part of 'stories_cubit.dart';

abstract class StoriesState extends Equatable {
  const StoriesState();

  @override
  List<Object> get props => [];
}

class StoriesInitial extends StoriesState {}

class StoriesLoading extends StoriesState {}

class StoriesSuccess extends StoriesState {
  final List<Story> stories;

  const StoriesSuccess({required this.stories});

  @override
  List<Object> get props => [stories];
}

class StoriesFailure extends StoriesState {
  final String message;

  const StoriesFailure({required this.message});

  @override
  List<Object> get props => [message];
}
