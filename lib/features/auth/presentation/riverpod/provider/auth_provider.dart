import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/features/auth/data/data_sources/remote/abstract_auth_api.dart';
import 'package:news_app_fe/features/auth/data/data_sources/remote/auth_impl_api.dart';
import 'package:news_app_fe/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:news_app_fe/features/auth/domain/repositories/abstract_auth_repo.dart';
import 'package:news_app_fe/features/auth/domain/usecases/login.dart';
import 'package:news_app_fe/features/auth/domain/usecases/register.dart';
import 'package:news_app_fe/features/auth/presentation/riverpod/notifier/login_form_notifier.dart';
import 'package:news_app_fe/features/auth/presentation/riverpod/notifier/register_form_notifier.dart';
import 'package:news_app_fe/features/auth/presentation/riverpod/notifier/register_notifier.dart';
import 'package:news_app_fe/features/auth/presentation/riverpod/state/login_form_state.dart';
import 'package:news_app_fe/features/auth/presentation/riverpod/notifier/login_notifier.dart';
import 'package:news_app_fe/features/auth/presentation/riverpod/state/login_state.dart';
import 'package:news_app_fe/features/auth/presentation/riverpod/state/register_form_state.dart';
import 'package:news_app_fe/features/auth/presentation/riverpod/state/register_state.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final authApiProvider = Provider<AbstractAuthApi>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return AuthImplApi(apiService);
});

// Repository
final authRepositoryProvider = Provider<AbstractAuthRepository>((ref) {
  final authApi = ref.watch(authApiProvider);
  return AuthRepositoryImpl(authApi);
});

// Domain layer provider for Login UseCase
final loginUseCaseProvider = Provider<Login>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return Login(authRepository);
});

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(ref),
);

final loginFormProvider =
    StateNotifierProvider<LoginFormNotifier, LoginFormState>(
      (ref) => LoginFormNotifier(),
    );

// Domain layer provider for Register UseCase
final registerUseCaseProvider = Provider<Register>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return Register(authRepository);
});

final registerProvider = StateNotifierProvider<RegisterNotifier, RegisterState>(
  (ref) => RegisterNotifier(ref),
);

final registerFormProvider =
    StateNotifierProvider<RegisterFormNotifier, RegisterFormState>(
      (ref) => RegisterFormNotifier(),
    );
