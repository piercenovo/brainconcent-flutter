import 'dart:convert';
import 'package:brainconcent_flutter/src/core/env/environment_config.dart';
import 'package:brainconcent_flutter/src/features/authentication/data/datasources/local/secure_storage.dart';
import 'package:brainconcent_flutter/src/features/authentication/domain/responses/default_response.dart';
import 'package:brainconcent_flutter/src/features/authentication/domain/responses/user_response.dart';
import 'package:brainconcent_flutter/src/features/authentication/domain/services/user_services.dart';
import 'package:http/http.dart' as http;

class UserServicesImpl implements UserServices {
  @override
  Future<DefaultResponse> createUser(
      String name, String username, String email, String password) async {
    final resp = await http.post(
        Uri.parse('${EnvironmentConfig.apiUrl}/user/create-user'),
        headers: {
          'Accept': 'application/json'
        },
        body: {
          'name': name,
          'username': username,
          'email': email,
          'password': password
        });
    return DefaultResponse.fromJson(jsonDecode(resp.body));
  }

  @override
  Future<UserResponse> getUserById() async {
    final token = await secureStorage.readToken();

    final resp = await http.get(
        Uri.parse('${EnvironmentConfig.apiUrl}/user/get-user-by-id'),
        headers: {'Accept': 'application/json', 'x-token': token!});
    return UserResponse.fromJson(jsonDecode(resp.body));
  }

  @override
  Future<DefaultResponse> verifyEmail(String code, String email) async {
    final resp = await http.get(
        Uri.parse('${EnvironmentConfig.apiUrl}/user/verify-email/$code/$email'),
        headers: {'Accept': 'application/json'});
    return DefaultResponse.fromJson(jsonDecode(resp.body));
  }
}

final userServices = UserServicesImpl();
