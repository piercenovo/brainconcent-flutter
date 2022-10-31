import 'package:brainconcent_flutter/src/core/error/exceptions.dart';
import 'package:brainconcent_flutter/src/core/error/failures.dart';
import 'package:brainconcent_flutter/src/core/network/network_info.dart';
import 'package:brainconcent_flutter/src/features/authentication/data/datasources/remote/auth_remote_data_source.dart';
import 'package:brainconcent_flutter/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:brainconcent_flutter/src/features/authentication/domain/responses/auth_response.dart';
import 'package:dartz/dartz.dart';

// typedef Future<Unit> LoginChecking();

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  // @override
  // Future<Either<Failure, Unit>> login(User user) async {
  //   final UserModel userModel =
  //       UserModel(username: user.username, password: user.password);

  //   return await _getMessage(() {
  //     return remoteDataSource.login(userModel);
  //   });
  // }

  //  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, AuthResponse>> login(
      String username, String password) async {
    try {
      final remoteAuth = await remoteDataSource.login(username, password);
      return Right(remoteAuth);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> renewLogin() async {
    try {
      final remoteAuth = await remoteDataSource.renewLogin();
      return Right(remoteAuth);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  // Future<Either<Failure, Unit>> _getMessage(LoginChecking loginChecking) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       await loginChecking();
  //       return const Right(unit);
  //     } on ServerException {
  //       return Left(ServerFailure());
  //     }
  //   } else {
  //     return Left(OfflineFailure());
  //   }
  // }
}
