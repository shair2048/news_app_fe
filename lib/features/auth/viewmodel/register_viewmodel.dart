import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/features/auth/viewmodel/register_state.dart';

class RegisterViewModel extends StateNotifier<RegisterState> {
  RegisterViewModel() : super(const RegisterState());

  void updateFullName(String value) {
    state = state.copyWith(fullName: value, fullNameError: null);
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value, emailError: null);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value, passwordError: null);
  }

  void updateConfirmPassword(String value) {
    state = state.copyWith(confirmPassword: value, confirmPasswordError: null);
  }

  void submit() {
    bool hasError = false;

    if (state.fullName.isEmpty) {
      state = state.copyWith(fullNameError: 'Full name is required');
      hasError = true;
    }

    if (!state.email.contains('@')) {
      state = state.copyWith(emailError: 'Invalid email');
      hasError = true;
    }

    if (state.password.length < 6) {
      state = state.copyWith(passwordError: 'Password too short');
      hasError = true;
    }

    if (state.password != state.confirmPassword) {
      state = state.copyWith(confirmPasswordError: 'Passwords do not match');
      hasError = true;
    }

    if (!hasError) {
      // TODO: Gọi API hoặc xử lý đăng ký
      print('Đăng ký thành công: ${state.fullName}, ${state.email}');
    }
  }
}
