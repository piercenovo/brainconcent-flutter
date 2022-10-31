import 'package:brainconcent_flutter/src/features/authentication/domain/responses/auth_response.dart';

abstract class AuthServices {
  Future<AuthResponse> login(String username, String password);
  Future<AuthResponse> renewLogin();
}
