import 'package:brainconcent_flutter/src/features/authentication/domain/responses/default_response.dart';
import 'package:brainconcent_flutter/src/features/authentication/domain/responses/user_response.dart';

abstract class UserServices {
  Future<DefaultResponse> createUser(
      String name, String username, String email, String password);
  // Future<UserModel> getUserById();
  Future<UserResponse> getUserById();
  Future<DefaultResponse> verifyEmail(String code, String email);
}
