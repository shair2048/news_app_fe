import 'package:news_app_fe/features/profile/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

// class ProfileState {
//   User user;
//   bool isDarkMode;
//   bool isLoading;

//   ProfileState({User? user, this.isDarkMode = false, this.isLoading = false})
//     : user =
//           user ?? User(name: 'unknown_user', email: 'unknown_user@gmail.com');

//   ProfileState copyWith({User? user, bool? isDarkMode, bool? isLoading}) {
//     return ProfileState(
//       user: user ?? this.user,
//       isDarkMode: isDarkMode ?? this.isDarkMode,
//       isLoading: isLoading ?? this.isLoading,
//     );
//   }
// }
@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;

  const factory ProfileState.loading() = ProfileLoading;

  const factory ProfileState.success({
    required User user,
    // required bool isDarkMode,
  }) = ProfileSuccess;

  const factory ProfileState.error({required String errorMessage}) =
      ProfileError;
}
