import 'package:brainconcent_flutter/src/core/error/failures.dart';
import 'package:brainconcent_flutter/src/features/authentication/domain/responses/auth_response.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> login(String username, String password);

  Future<Either<Failure, AuthResponse>> renewLogin();
}
