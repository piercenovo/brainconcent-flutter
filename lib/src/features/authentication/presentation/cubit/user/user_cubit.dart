import 'package:brainconcent_flutter/src/features/authentication/data/models/user_model.dart';
import 'package:brainconcent_flutter/src/features/authentication/data/services/user_services_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState());

  Future<void> getUserAuthentication() async {
    try {
      final data = await userServices.getUserById();
      emit(state.copyWith(user: data.user));
    } catch (e) {
      emit(FailureUserState(error: e.toString()));
    }
  }

  Future<void> registerUser(
      String name, String username, String email, String password) async {
    try {
      emit(LoadingUserState());

      await Future.delayed(const Duration(milliseconds: 550));

      final data =
          await userServices.createUser(name, username, email, password);

      if (data.resp) {
        emit(SuccessUserState());
      } else {
        emit(FailureUserState(error: data.message));
      }
    } catch (e) {
      emit(FailureUserState(error: e.toString()));
    }
  }

  Future<void> verifyEmail(String code, String email) async {
    try {
      emit(LoadingUserState());

      final data = await userServices.verifyEmail(code, email);

      await Future.delayed(const Duration(milliseconds: 350));

      if (data.resp) {
        emit(SuccessUserState());
      } else {
        emit(FailureUserState(error: data.message));
      }
    } catch (e) {
      emit(FailureUserState(error: e.toString()));
    }
  }

  Future<void> logOutAuth() async {
    emit(state.copyWith(user: null));
  }
}
