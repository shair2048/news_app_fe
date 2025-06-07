import 'package:flutter/material.dart';

class ProfileUser {
  final String name;
  final String email;
  final String? avatarUrl;

  ProfileUser({required this.name, required this.email, this.avatarUrl});

  ProfileUser copyWith({String? name, String? email, String? avatarUrl}) {
    return ProfileUser(
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
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
