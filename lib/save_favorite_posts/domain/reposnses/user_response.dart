import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:save_favorite_posts/save_favorite_posts/shared/constant/assets_manager.dart';

class UserResponse extends Equatable {
  final int id;
  final String name;
  final String email;
  final String pass;
  final Image profileImg;

  const UserResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.pass,
    required this.profileImg,
  });

  @override
  List<Object?> get props => [id, name, email, pass, profileImg];
}

List<UserResponse> userResponse = [
  UserResponse(id: 1, name: 'walid mohamed', email: 'walid@gmail.com', pass: '123456@Wer', profileImg: Image.asset(AssetsManager.profileImg)),
  UserResponse(id: 2, name: 'ali ahmed', email: 'ali@gmail.com', pass: '123456@Wer', profileImg: Image.asset(AssetsManager.profileImg2)),
];