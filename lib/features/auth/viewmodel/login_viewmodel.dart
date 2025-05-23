import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/core/utils/validators.dart';
import 'package:news_app_fe/features/auth/viewmodel/login_state.dart';

final loginProvider = StateNotifierProvider<LoginViewModel, LoginState>(
  (ref) => LoginViewModel(),
);

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel() : super(LoginState());

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void reset() {
    state = LoginState.initial();
  }

  bool get isEmailValid => Validators.isValidEmail(state.email);
  bool get isPasswordValid => Validators.isValidPassword(state.password);
}
