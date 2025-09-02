import 'package:dartz/dartz.dart';
import 'package:news_app_fe/core/errors/failures.dart';
import 'package:news_app_fe/features/auth/domain/repositories/abstract_auth_repo.dart';

class RegisterParams {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterParams({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}

class Register {
  final AbstractAuthRepository authRepository;

  Register(this.authRepository);

  Future<Either<Failure, void>> call(RegisterParams params) async {
    return await authRepository.register(
      fullName: params.fullName,
      email: params.email,
      password: params.password,
      confirmPassword: params.confirmPassword,
    );
  }
}
