import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app_fe/shared/domain/entities/user.dart';

part 'profile_state.freezed.dart';

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
