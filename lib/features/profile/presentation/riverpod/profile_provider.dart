import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/features/profile/data/data_sources/abstract_user_info_api.dart';
import 'package:news_app_fe/features/profile/data/data_sources/user_info_impl_api.dart';
import 'package:news_app_fe/features/profile/data/repositories/user_info_repo_impl.dart';
import 'package:news_app_fe/features/profile/domain/entities/user_info_params.dart';
import 'package:news_app_fe/features/profile/domain/repositories/abstract_user_info_repo.dart';
import 'package:news_app_fe/features/profile/domain/usecases/get_user_info.dart';
import 'package:news_app_fe/features/profile/presentation/riverpod/profile_state.dart';
import '../../data/models/user_model.dart';

final storageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage(); // const để tránh tạo lại
});

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final userInfoApiProvider = Provider<AbstractUserInfoApi>(
  (ref) => UserInfoImplApi(ref.watch(apiServiceProvider)),
);

final userRepositoryProvider = Provider<AbstractUserInfoRepository>((ref) {
  final apiService = ref.read(userInfoApiProvider);
  return UserInfoRepositoryImpl(apiService);
});

// Provider for usecase
final getUserInfoProvider = Provider<GetUserInfo>((ref) {
  return GetUserInfo(ref.watch(userRepositoryProvider));
});

final profileProvider = StateNotifierProvider<ProfileViewmodel, ProfileState>((
  ref,
) {
  final storage = ref.read(storageProvider);
  final getUserInfo = ref.read(getUserInfoProvider);
  return ProfileViewmodel(ref, storage, getUserInfo);
});

class ProfileViewmodel extends StateNotifier<ProfileState> {
  final Ref ref;
  final FlutterSecureStorage storage;
  final GetUserInfo getUserInfo;

  ProfileViewmodel(this.ref, this.storage, this.getUserInfo)
    : super(ProfileState()) {
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
      final user = await getUserInfo(
        UserInfoParams(userId: id ?? '', accessToken: accessToken ?? ''),
      );

      state = state.copyWith(
        user: UserModel(name: user.name, email: user.email),
        isLoading: false,
      );
    } catch (error) {
      throw Exception('User data loading failed: $error');
    }
  }
}
