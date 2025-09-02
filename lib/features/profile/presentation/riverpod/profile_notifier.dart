import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:news_app_fe/features/profile/domain/entities/user_info_params.dart';
import 'package:news_app_fe/features/profile/domain/usecases/get_user_info.dart';
import 'package:news_app_fe/features/profile/presentation/riverpod/profile_state.dart';

class ProfileNotifier extends StateNotifier<ProfileState> {
  final GetUserInfo _getUserInfoUseCase;
  final FlutterSecureStorage _storage;

  ProfileNotifier({
    required GetUserInfo getUserInfoUseCase,
    required FlutterSecureStorage storage,
  }) : _getUserInfoUseCase = getUserInfoUseCase,
       _storage = storage,
       super(ProfileState.initial());

  Future<void> loadUserProfile({bool showLoading = true}) async {
    try {
      if (showLoading) {
        state = const ProfileState.loading();
      }

      final userId = await _storage.read(key: 'id');
      final accessToken = await _storage.read(key: 'token');

      if (userId == null || accessToken == null) {
        state = ProfileState.error(
          errorMessage: 'Authentication credentials not found',
        );
        return;
      }

      final result = await _getUserInfoUseCase.call(
        UserInfoParams(userId: userId, accessToken: accessToken),
      );

      result.fold(
        (failure) => state = ProfileState.error(errorMessage: failure.message),
        (user) => state = ProfileState.success(user: user),
      );
    } catch (e) {
      state = ProfileState.error(
        errorMessage: 'Unexpected error: ${e.toString()}',
      );
    }
  }

  Future<void> refreshUserProfile() async {
    await loadUserProfile(showLoading: false);
  }

  void resetProfile() {
    state = const ProfileState.initial();
  }

  Future<void> updateProfile() async {
    // Implementation for updating profile
  }

  Future<void> logout() async {
    await _storage.deleteAll();
    resetProfile();
  }
}
