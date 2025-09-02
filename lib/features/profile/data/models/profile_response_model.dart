import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:news_app_fe/shared/data/models/user_model.dart';

part 'profile_response_model.g.dart';

@JsonSerializable()
class ProfileResponseModel {
  @JsonKey(name: 'data')
  final UserModel user;

  const ProfileResponseModel({required this.user});

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);

  // User toEntity() {
  //   return User(name: name, email: email, avatarUrl: avatarUrl);
  // }
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
