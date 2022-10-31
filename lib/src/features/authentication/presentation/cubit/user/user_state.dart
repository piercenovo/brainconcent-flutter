part of 'user_cubit.dart';

class UserState extends Equatable {
  const UserState({this.user});

  final User? user;

  UserState copyWith({User? user}) => UserState(
        user: user ?? this.user,
      );

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class LoadingUserState extends UserState {}

class SuccessUserState extends UserState {}

class FailureUserState extends UserState {
  final String error;

  const FailureUserState({required this.error});
  @override
  List<Object> get props => [error];
}
