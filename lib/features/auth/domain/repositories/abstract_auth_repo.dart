import 'package:dartz/dartz.dart';
import 'package:news_app_fe/core/errors/failures.dart';
import 'package:news_app_fe/features/auth/domain/entities/auth_response.dart';

abstract class AbstractAuthRepository {
  Future<Either<Failure, AuthResponse>> register({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  });

  Future<Either<Failure, AuthResponse>> login({
    required String email,
    required String password,
  });
}
