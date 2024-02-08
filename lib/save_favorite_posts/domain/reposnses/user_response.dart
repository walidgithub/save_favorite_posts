import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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