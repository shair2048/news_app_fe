import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:logging/logging.dart';
import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/core/utils/validators.dart';
import 'package:news_app_fe/features/auth/repositories/auth_repository.dart';
import 'package:news_app_fe/features/auth/viewmodel/login_state.dart';

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
    final storage = FlutterSecureStorage();

    try {
      final submitResult = await repo.login(state.email, state.password);

      // Save token and user data to secure storage
      await storage.write(key: "token", value: submitResult.token);
      await storage.write(key: "id", value: submitResult.id);

      // Update the auth state
      // await ref.read(authViewModelProvider.notifier).login(submitResult.token);
    } catch (error) {
      throw Exception('Login failed: $error');
    }
  }
}
