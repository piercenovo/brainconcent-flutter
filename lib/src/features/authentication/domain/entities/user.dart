import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String username;
  final String email;
  final String password;
  final String avatar;
  final String uid;

  const User({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.avatar,
    required this.uid,
  });

  @override
  List<Object?> get props => [
        name,
        username,
        email,
        password,
        avatar,
        uid,
      ];
}
