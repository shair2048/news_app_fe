import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:news_app_fe/features/profile/domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final String email;
  final String? avatarUrl;

  const UserModel({required this.name, required this.email, this.avatarUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  User toEntity() {
    return User(name: name, email: email, avatarUrl: avatarUrl);
  }
}

class ProfileMenuItem {
  String title;
  String iconPath;
  VoidCallback? onTap;
  bool hasSwitch;
  bool? switchValue;
  ValueChanged<bool>? onSwitchChanged;

  ProfileMenuItem({
    required this.title,
    required this.iconPath,
    this.onTap,
    this.hasSwitch = false,
    this.switchValue,
    this.onSwitchChanged,
  });
}
