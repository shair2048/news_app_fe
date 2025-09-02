import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app_fe/features/auth/domain/entities/auth_response.dart';

part 'login_state.freezed.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;

  const factory LoginState.loading() = LoginLoading;

  const factory LoginState.success(AuthResponse authResponse) = LoginSuccess;

  const factory LoginState.error(String errorMessage) = LoginError;
}
