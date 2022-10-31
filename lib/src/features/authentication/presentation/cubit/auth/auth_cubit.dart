import 'package:brainconcent_flutter/src/features/authentication/data/datasources/local/secure_storage.dart';
import 'package:brainconcent_flutter/src/features/authentication/data/services/auth_services_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login(String username, String password) async {
    try {
      emit(AuthLoading());

      final data = await authServices.login(username, password);
      await Future.delayed(const Duration(milliseconds: 350));

      if (data.resp) {
        await secureStorage.deleteSecureStorage();
        await secureStorage.persistenToken(data.token!);

        emit(AuthSuccess());
      } else {
        emit(AuthFailure(error: data.message));
      }
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  Future<void> onCheckingLogin() async {
    try {
      await Future.delayed(const Duration(milliseconds: 850));

      if (await secureStorage.readToken() != null) {
        final data = await authServices.renewLogin();

        if (data.resp) {
          await secureStorage.persistenToken(data.token!);

          emit(AuthSuccess());
        } else {
          await secureStorage.deleteSecureStorage();
          emit(LogOutState());
        }
      } else {
        await secureStorage.deleteSecureStorage();
        emit(LogOutState());
      }
    } catch (e) {
      await secureStorage.deleteSecureStorage();
      emit(LogOutState());
    }
  }

  Future<void> onLogOut() async {
    await secureStorage.deleteSecureStorage();
    emit(LogOutState());
  }
}
