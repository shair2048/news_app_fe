import 'package:dartz/dartz.dart';
import 'package:news_app_fe/core/errors/failures.dart';
import 'package:news_app_fe/features/auth/domain/repositories/abstract_auth_repo.dart';

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}

class Login {
  final AbstractAuthRepository authRepository;

  Login(this.authRepository);

  Future<Either<Failure, void>> call(LoginParams params) async {
    return await authRepository.login(
      email: params.email,
      password: params.password,
    );
  }
}
