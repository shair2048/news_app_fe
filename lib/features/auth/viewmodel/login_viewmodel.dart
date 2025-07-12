import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:logging/logging.dart';
import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/core/utils/validators.dart';
import 'package:news_app_fe/features/auth/repositories/auth_repository.dart';
import 'package:news_app_fe/features/auth/viewmodel/login_state.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final loginProvider = StateNotifierProvider<LoginViewModel, LoginState>(
  (ref) => LoginViewModel(ref),
);
final apiServiceProvider = Provider<ApiService>((ref) => ApiService());
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.read(apiServiceProvider)),
);
// final log = Logger('RegisterViewModel');

class LoginViewModel extends StateNotifier<LoginState> {
  final Ref ref;
  LoginViewModel(this.ref) : super(LoginState());

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

  Future<void> submit() async {
    final repo = ref.read(authRepositoryProvider);

    try {
      final token = await repo.login(state.email, state.password);
      // await storage.write(key: "token", value: token);
      // final value = await storage.read(key: "token");
      // print("Token stored: $value");
    } catch (error) {
      throw Exception('Login failed: $error');
    }
  }
}
