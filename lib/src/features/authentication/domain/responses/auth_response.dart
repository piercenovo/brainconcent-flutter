import 'dart:convert';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse({
    required this.resp,
    required this.message,
    this.token,
  });

  bool resp;
  String message;
  String? token;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        resp: json["resp"],
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "message": message,
        "token": token,
      };
}
