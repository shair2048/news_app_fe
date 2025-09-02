import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/core/utils/validators.dart';
import 'package:news_app_fe/features/auth/presentation/riverpod/state/login_form_state.dart';

class LoginFormNotifier extends StateNotifier<LoginFormState> {
  LoginFormNotifier() : super(const LoginFormState());

  void setEmail(String email) {
    final isValid = Validators.isValidEmail(email);
    state = state.copyWith(
      email: email,
      emailError: isValid ? null : 'Invalid email',
    );
  }

  void setPassword(String password) {
    final isValid = Validators.isValidPassword(password);
    state = state.copyWith(
      password: password,
      passwordError: isValid ? null : 'Invalid password',
    );
  }

  void reset() {
    state = const LoginFormState();
  }
}
