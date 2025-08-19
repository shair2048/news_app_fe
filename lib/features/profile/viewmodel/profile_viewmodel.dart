import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/features/profile/repositories/profile_repository.dart';
import 'package:news_app_fe/features/profile/viewmodel/profile_state.dart';
import '../model/profile_model.dart';

final storageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage(); // const để tránh tạo lại
});

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return ProfileRepositoryImpl(apiService);
});

final profileProvider = StateNotifierProvider<ProfileViewmodel, ProfileState>((
  ref,
) {
  final storage = ref.read(storageProvider);
  final repo = ref.read(profileRepositoryProvider);
  return ProfileViewmodel(ref, storage, repo);
});

class ProfileViewmodel extends StateNotifier<ProfileState> {
  final Ref ref;
  final FlutterSecureStorage storage;
  final ProfileRepository repo;

  ProfileViewmodel(this.ref, this.storage, this.repo) : super(ProfileState()) {
    loadUserData();
  }

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
      // ProfileMenuItem(
      //   title: 'Edit Profile',
      //   iconPath: 'assets/icons/pencil.svg',
      //   onTap: () => navigateToEditProfile(context),
      // ),
      // ProfileMenuItem(
      //   title: 'My Article',
      //   iconPath: 'assets/icons/notepencil.svg',
      //   onTap: () => navigateToMyArticle(context),
      // ),
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

  Future<void> loadUserData() async {
    final id = await storage.read(key: 'id');
    final accessToken = await storage.read(key: 'token');

    try {
      final userInfo = await repo.getUserInformation(
        userId: id!,
        accessToken: accessToken!,
      );

      state = state.copyWith(user: userInfo, isLoading: false);
    } catch (error) {
      throw Exception('User data loading failed: $error');
    }
  }
}
