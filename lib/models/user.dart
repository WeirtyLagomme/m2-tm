import 'package:flutter/foundation.dart';

class User {
  final String username;
  final String name;
  final String pictureUrl;

  User({
    required this.username,
    required this.name,
    required this.pictureUrl,
  });
  
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['data']['first_name'],
      name: json['data']['first_name'] + ' ' + json['data']['last_name'],
      pictureUrl: json['data']['avatar'],
    );
  }
}
