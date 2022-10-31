// ignore_for_file: file_names

import 'package:brainconcent_flutter/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:brainconcent_flutter/src/features/authentication/domain/responses/auth_response.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

class CheckingLoginUsecase {
  final AuthRepository repository;

  CheckingLoginUsecase(this.repository);

  Future<Either<Failure, AuthResponse>> call() async {
    return await repository.renewLogin();
  }
}
