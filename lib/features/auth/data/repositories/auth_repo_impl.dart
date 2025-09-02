import 'package:dartz/dartz.dart';
import 'package:news_app_fe/core/errors/exceptions.dart';
import 'package:news_app_fe/core/errors/failures.dart';
import 'package:news_app_fe/features/auth/data/data_sources/remote/abstract_auth_api.dart';
import 'package:news_app_fe/features/auth/domain/entities/auth_response.dart';
import 'package:news_app_fe/features/auth/domain/repositories/abstract_auth_repo.dart';

class AuthRepositoryImpl implements AbstractAuthRepository {
  final AbstractAuthApi authApi;

  AuthRepositoryImpl(this.authApi);

  @override
  Future<Either<Failure, AuthResponse>> register({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final authResponseModel = await authApi.register(
        fullName: fullName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );

      final authResponse = AuthResponse(
        token: authResponseModel.token,
        user: authResponseModel.user.toEntity(),
      );

      return Right(authResponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      final authResponseModel = await authApi.login(email, password);

      // Convert model to entity
      final authResponse = AuthResponse(
        token: authResponseModel.token,
        user: authResponseModel.user.toEntity(),
      );

      return Right(authResponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
