// ignore_for_file: constant_identifier_names
import 'dart:convert';
import 'package:brainconcent_flutter/src/core/env/environment_config.dart';
import 'package:brainconcent_flutter/src/features/authentication/data/datasources/local/secure_storage.dart';
import 'package:brainconcent_flutter/src/features/authentication/data/datasources/remote/auth_remote_data_source.dart';
import 'package:brainconcent_flutter/src/features/authentication/domain/responses/auth_response.dart';

import '../../../../../core/error/exceptions.dart';
import 'package:http/http.dart' as http;

class HttpAuthDataSource implements AuthRemoteDataSource {
  final http.Client client;

  HttpAuthDataSource({required this.client});

  @override
  Future<AuthResponse> login(String username, String password) async {
    final response = await client
        .post(Uri.parse('${EnvironmentConfig.apiUrl}/auth/login'), headers: {
      "Content-Type": "application/json"
    }, body: {
      'username': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      return AuthResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AuthResponse> renewLogin() async {
    final token = await secureStorage.readToken();

    final response = await client.get(
        Uri.parse('${EnvironmentConfig.apiUrl}/auth/login'),
        headers: {"Content-Type": "application/json", 'x-token': token!});

    if (response.statusCode == 200) {
      return AuthResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
