import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/core/utils/validators.dart';
import 'package:news_app_fe/features/auth/viewmodel/login_state.dart';

final loginProvider = StateNotifierProvider<LoginViewModel, LoginState>(
  (ref) => LoginViewModel(),
);

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel() : super(LoginState());

  bool get isEmailValid => Validators.isValidEmail(state.email);
  bool get isPasswordValid => Validators.isValidPassword(state.password);

  void setEmail(String email) {
    final isValidEmail = Validators.isValidEmail(email);
    state = state.copyWith(
      email: email,
      emailError: isValidEmail ? null : 'Invalid email',
    );
  }

  void setPassword(String password) {
    final isValidPassword = Validators.isValidPassword(password);
    state = state.copyWith(
      password: password,
      passwordError: isValidPassword ? null : 'Invalid password',
    );
  }

  void reset() {
    state = LoginState.initial();
  }

  void submit() {}
}
