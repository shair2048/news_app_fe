import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:news_app_fe/features/auth/presentation/riverpod/provider/auth_provider.dart';
import 'package:news_app_fe/features/auth/presentation/riverpod/state/login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final Ref ref;

  LoginNotifier(this.ref) : super(const LoginState.initial());

  void reset() {
    ref.read(loginFormProvider.notifier).reset();
    state = LoginState.initial();
  }

  Future<void> submit() async {
    final formState = ref.read(loginFormProvider);

    state = const LoginState.loading();
    final repo = ref.read(authRepositoryProvider);
    final storage = const FlutterSecureStorage();

    try {
      final result = await repo.login(
        email: formState.email,
        password: formState.password,
      );

      result.fold(
        (failure) {
          state = LoginState.error(failure.message);
        },
        (authResponse) async {
          await storage.write(key: "token", value: authResponse.token);
          await storage.write(key: "id", value: authResponse.user.id);

          state = LoginState.success(authResponse);
        },
      );
    } catch (error) {
      throw Exception('Login failed: $error');
    }
  }
}
