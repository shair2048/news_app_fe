import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_fe/features/profile/viewmodel/profile_state.dart';
import '../model/profile_model.dart';

final profileProvider = StateNotifierProvider<ProfileViewmodel, ProfileState>(
  (ref) => ProfileViewmodel(),
);

class ProfileViewmodel extends StateNotifier<ProfileState> {
  ProfileViewmodel() : super(ProfileState());

  void toggleDarkMode(bool value) {
    state = state.copyWith(isDarkMode: value);
  }

  void navigateToEditProfile(BuildContext context) {
    // context.push('/edit-profile');
  }

  void navigateToMyArticle(BuildContext context) {
    // context.push('/my-articles');
  }

  void navigateToBookmark(BuildContext context) {
    context.go('/bookmark');
  }

  void logout(BuildContext context) {
    context.go('/home');
  }

  List<ProfileMenuItem> getMenuItems(BuildContext context) {
    return [
      ProfileMenuItem(
        title: 'Dark Mode',
        iconPath: 'assets/icons/sun.svg',
        hasSwitch: true,
        switchValue: state.isDarkMode,
        onSwitchChanged: toggleDarkMode,
      ),
      ProfileMenuItem(
        title: 'Edit Profile',
        iconPath: 'assets/icons/pencil.svg',
        onTap: () => navigateToEditProfile(context),
      ),
      ProfileMenuItem(
        title: 'My Article',
        iconPath: 'assets/icons/notepencil.svg',
        onTap: () => navigateToMyArticle(context),
      ),
      ProfileMenuItem(
        title: 'Bookmark',
        iconPath: 'assets/icons/bookmark.svg',
        onTap: () => navigateToBookmark(context),
      ),
      ProfileMenuItem(
        title: 'Log-out',
        iconPath: 'assets/icons/logout.svg',
        onTap: () => logout(context),
      ),
    ];
  }
}
