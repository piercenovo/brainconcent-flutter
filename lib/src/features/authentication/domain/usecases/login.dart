import 'package:brainconcent_flutter/src/features/authentication/domain/responses/auth_response.dart';
import 'package:brainconcent_flutter/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  Future<Either<Failure, AuthResponse>> call(
      String username, String password) async {
    return await repository.login(username, password);
  }
}
