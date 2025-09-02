import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_state.freezed.dart';

@freezed
abstract class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    @Default('') String email,
    String? emailError,
    @Default('') String password,
    String? passwordError,
  }) = _LoginFormState;
}

extension LoginFormStateX on LoginFormState {
  bool get isValid =>
      email.isNotEmpty &&
      password.isNotEmpty &&
      emailError == null &&
      passwordError == null;
}
