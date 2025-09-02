import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:news_app_fe/features/auth/presentation/riverpod/provider/auth_provider.dart';
import 'package:news_app_fe/features/auth/presentation/riverpod/state/register_state.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  final Ref ref;

  RegisterNotifier(this.ref) : super(const RegisterState.initial());

  void reset() {
    ref.read(registerFormProvider.notifier).reset();
    state = RegisterState.initial();
  }

  Future<void> submit() async {
    final formState = ref.read(registerFormProvider);

    state = const RegisterState.loading();
    final repo = ref.read(authRepositoryProvider);
    final storage = const FlutterSecureStorage();

    try {
      final result = await repo.register(
        fullName: formState.fullName,
        email: formState.email,
        password: formState.password,
        confirmPassword: formState.confirmPassword,
      );

      result.fold(
        (failure) {
          state = RegisterState.error(failure.message);
        },
        (authResponse) async {
          await storage.write(key: "token", value: authResponse.token);
          await storage.write(key: "id", value: authResponse.user.id);

          state = RegisterState.success(authResponse);
        },
      );
    } catch (error) {
      throw Exception('Registration failed: $error');
    }
  }
}
