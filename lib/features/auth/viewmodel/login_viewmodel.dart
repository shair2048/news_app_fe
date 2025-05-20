import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/features/auth/viewmodel/login_state.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel() : super(LoginState());

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }
}
