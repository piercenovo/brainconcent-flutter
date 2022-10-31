import 'dart:convert';

import 'package:brainconcent_flutter/src/features/authentication/data/models/user_model.dart';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse({
    required this.resp,
    required this.message,
    required this.user,
  });

  bool resp;
  String message;
  UserModel user;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        resp: json["resp"],
        message: json["message"],
        user: UserModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "message": message,
        "user": user.toJson(),
      };
}
