import 'dart:convert';
import 'package:brainconcent_flutter/src/core/env/environment_config.dart';
import 'package:brainconcent_flutter/src/features/authentication/data/datasources/local/secure_storage.dart';
import 'package:brainconcent_flutter/src/features/authentication/domain/responses/auth_response.dart';
import 'package:brainconcent_flutter/src/features/authentication/domain/services/auth_services.dart';
import 'package:http/http.dart' as http;

class AuthServicesImpl implements AuthServices {
  @override
  Future<AuthResponse> login(String username, String password) async {
    final resp = await http
        .post(Uri.parse('${EnvironmentConfig.apiUrl}/auth/login'), headers: {
      'Accept': 'application/json',
    }, body: {
      'username': username,
      'password': password
    });
    return AuthResponse.fromJson(jsonDecode(resp.body));
  }

  @override
  Future<AuthResponse> renewLogin() async {
    final token = await secureStorage.readToken();

    final resp = await http.get(
        Uri.parse('${EnvironmentConfig.apiUrl}/auth/renew'),
        headers: {'Accept': 'application/json', 'x-token': token!});
    return AuthResponse.fromJson(jsonDecode(resp.body));
  }
}

final authServices = AuthServicesImpl();
