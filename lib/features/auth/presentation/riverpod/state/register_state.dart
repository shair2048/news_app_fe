import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app_fe/features/auth/domain/entities/auth_response.dart';

part 'register_state.freezed.dart';

@freezed
sealed class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = RegisterInitial;

  const factory RegisterState.loading() = RegisterLoading;

  const factory RegisterState.success(AuthResponse authResponse) =
      RegisterSuccess;

  const factory RegisterState.error(String errorMessage) = RegisterError;
}
