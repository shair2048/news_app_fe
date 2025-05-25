import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/core/utils/validators.dart';
import 'package:news_app_fe/features/auth/viewmodel/register_state.dart';

final registerProvider =
    StateNotifierProvider<RegisterViewModel, RegisterState>(
      (ref) => RegisterViewModel(),
    );

class RegisterViewModel extends StateNotifier<RegisterState> {
  RegisterViewModel() : super(const RegisterState());

  void setFullName(String fullname) {
    state = state.copyWith(fullName: fullname);
  }

  void setEmail(String email) {
    final isValidEmail = Validators.isValidEmail(email);
    state = state.copyWith(
      email: email,
      emailError: isValidEmail ? null : 'Invalid email',
    );
  }

  void setPassword(String password) {
    final isValidPassword = Validators.isValidEmail(password);
    state = state.copyWith(
      password: password,
      passwordError: isValidPassword ? null : 'Invalid password',
    );
  }

  void setConfirmPassword(String confirmPassword) {
    final isValidConfirmPassword = Validators.isValidEmail(confirmPassword);
    state = state.copyWith(
      confirmPassword: confirmPassword,
      confirmPasswordError:
          isValidConfirmPassword ? null : 'Invalid confirm password',
    );
  }

  void reset() {
    state = RegisterState.initial();
  }

  void submit() {}
}
