import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_form_state.freezed.dart';

@freezed
abstract class RegisterFormState with _$RegisterFormState {
  const factory RegisterFormState({
    @Default('') String fullName,
    @Default('') String email,
    String? emailError,
    @Default('') String password,
    String? passwordError,
    @Default('') String confirmPassword,
    String? confirmPasswordError,
  }) = _RegisterFormState;
}

extension RegisterFormStateX on RegisterFormState {
  bool get isValid =>
      fullName.trim().isNotEmpty &&
      email.trim().isNotEmpty &&
      password.trim().isNotEmpty &&
      confirmPassword.trim().isNotEmpty &&
      emailError == null &&
      passwordError == null;
}
