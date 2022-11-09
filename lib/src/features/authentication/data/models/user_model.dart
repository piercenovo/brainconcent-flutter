import 'dart:convert';

import 'package:brainconcent_flutter/src/features/authentication/domain/entities/user.dart';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends User {
  const UserModel({
    required String name,
    required String username,
    required String email,
    required String password,
    required String avatar,
    required String uid,
  }) : super(
          name: name,
          username: username,
          email: email,
          password: password,
          avatar: avatar,
          uid: uid,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        avatar: json["avatar"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "email": email,
        "password": password,
        "avatar": avatar,
        "uid": uid,
      };
}
