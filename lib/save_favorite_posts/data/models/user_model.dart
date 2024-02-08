import '../../domain/reposnses/user_response.dart';
import '../../shared/constant/assets_manager.dart';
import 'package:flutter/material.dart';

class UserModel extends UserResponse {

  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.pass,
    required super.profileImg,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: (json['id'] as num).toInt(),
      name: json['name'],
      email: json['email'],
      pass: json['pass'],
      profileImg: json['profileImg'],
    );
  }
}

List<UserModel> userModel = [
  UserModel(id: 1, name: 'walid mohamed', email: 'walid@gmail.com', pass: '123456@Wer', profileImg: Image.asset(AssetsManager.profileImg)),
  UserModel(id: 2, name: 'ali ahmed', email: 'ali@gmail.com', pass: '123456@Wer', profileImg: Image.asset(AssetsManager.profileImg2)),
];