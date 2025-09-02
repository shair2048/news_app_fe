import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/features/profile/data/data_sources/remote/abstract_user_info_api.dart';
import 'package:news_app_fe/features/profile/data/data_sources/remote/user_info_impl_api.dart';
import 'package:news_app_fe/features/profile/data/repositories/user_info_repo_impl.dart';
import 'package:news_app_fe/features/profile/domain/repositories/abstract_user_info_repo.dart';
import 'package:news_app_fe/features/profile/domain/usecases/get_user_info.dart';
import 'package:news_app_fe/features/profile/presentation/riverpod/profile_notifier.dart';
import 'package:news_app_fe/features/profile/presentation/riverpod/profile_state.dart';

// Core providers
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),

    // iOptions: IOSOptions(
    //   accessibility: IOSAccessibility.first_unlock_this_device,
    // ),
  );
});

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

// Data layer providers
final userInfoApiProvider = Provider<AbstractUserInfoApi>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return UserInfoImplApi(apiService);
});

// Repository provider
final userInfoRepositoryProvider = Provider<AbstractUserInfoRepository>((ref) {
  final userInfoApi = ref.watch(userInfoApiProvider);
  return UserInfoRepositoryImpl(userInfoApi);
});

// Domain layer provider (UseCase)
final getUserInfoUseCaseProvider = Provider<GetUserInfo>((ref) {
  final repository = ref.watch(userInfoRepositoryProvider);
  return GetUserInfo(repository);
});

// Presentation layer provider (Main provider)
final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((
  ref,
) {
  final getUserInfoUseCase = ref.watch(getUserInfoUseCaseProvider);
  final secureStorage = ref.watch(secureStorageProvider);

  return ProfileNotifier(
    getUserInfoUseCase: getUserInfoUseCase,
    storage: secureStorage,
  );
});

// Computed providers (Optional - for easier access to specific data)
// final currentUserProvider = Provider<User?>((ref) {
//   final profileState = ref.watch(profileProvider);
//   return profileState.maybeWhen(success: (user) => user, orElse: () => null);
// });

// final isProfileLoadingProvider = Provider<bool>((ref) {
//   final profileState = ref.watch(profileProvider);
//   return profileState.maybeWhen(loading: () => true, orElse: () => false);
// });

// final profileErrorProvider = Provider<String?>((ref) {
//   final profileState = ref.watch(profileProvider);
//   return profileState.maybeWhen(
//     error: (errorMessage) => errorMessage,
//     orElse: () => null,
//   );
// });
