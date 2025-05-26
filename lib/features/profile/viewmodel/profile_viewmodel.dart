import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../model/profile_model.dart';

class ProfileViewmodel extends StateNotifier<ProfileState> {
  ProfileViewmodel() : super(ProfileState());

  void toggleDarkMode(bool value) {
    state = state.copyWith(isDarkMode: value);
  }

  void navigateToEditProfile(BuildContext context) {
    print('Navigate to Edit Profile');
    // context.push('/edit-profile');
  }

  void navigateToMyArticle(BuildContext context) {
    print('Navigate to My Articles');
    // context.push('/my-articles');
  }

  void navigateToBookmark(BuildContext context) {
    context.go('/bookmark');
  }

  void logout(BuildContext context) {
    print('User logged out');
    context.go('/login');
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

class ProfileState {
  final ProfileUser user;
  final bool isDarkMode;
  final bool isLoading;

  ProfileState({
    ProfileUser? user,
    this.isDarkMode = false,
    this.isLoading = false,
  }) : user = user ?? ProfileUser(
    name: 'Tinsh',
    email: 'tinsh@gmail.com',
  );

  ProfileState copyWith({
    ProfileUser? user,
    bool? isDarkMode,
    bool? isLoading,
  }) {
    return ProfileState(
      user: user ?? this.user,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

final profileProvider = StateNotifierProvider<ProfileViewmodel, ProfileState>((ref) {
  return ProfileViewmodel();
});