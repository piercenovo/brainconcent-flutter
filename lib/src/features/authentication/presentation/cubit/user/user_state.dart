part of 'user_cubit.dart';

class UserState {
  final UserModel? user;

  const UserState({this.user});

  UserState copyWith({UserModel? user}) => UserState(
        user: user ?? this.user,
      );
}

class UserInitial extends UserState {}

class LoadingUserState extends UserState {}

class SuccessUserState extends UserState {}

class FailureUserState extends UserState {
  final String error;

  const FailureUserState({required this.error});
}
