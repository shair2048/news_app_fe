import 'package:flutter/material.dart';

class UserModel {
  final String name;
  final String email;
  final String? avatarUrl;

  UserModel({required this.name, required this.email, this.avatarUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      avatarUrl: json['avatarUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'avatarUrl': avatarUrl};
  }
}

class ProfileMenuItem {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;
  final bool hasSwitch;
  final bool? switchValue;
  final ValueChanged<bool>? onSwitchChanged;

  ProfileMenuItem({
    required this.title,
    required this.iconPath,
    this.onTap,
    this.hasSwitch = false,
    this.switchValue,
    this.onSwitchChanged,
  });
}
