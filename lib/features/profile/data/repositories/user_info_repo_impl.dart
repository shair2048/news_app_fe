import 'package:dartz/dartz.dart';
import 'package:news_app_fe/core/errors/failures.dart';
import 'package:news_app_fe/features/profile/data/data_sources/remote/abstract_user_info_api.dart';
import 'package:news_app_fe/features/profile/domain/entities/user.dart';
import 'package:news_app_fe/features/profile/domain/entities/user_info_params.dart';
import 'package:news_app_fe/features/profile/domain/repositories/abstract_user_info_repo.dart';

class UserInfoRepositoryImpl implements AbstractUserInfoRepository {
  final AbstractUserInfoApi userInfoApi;

  UserInfoRepositoryImpl(this.userInfoApi);

  @override
  Future<Either<Failure, User>> getUserInfo(UserInfoParams params) async {
    try {
      final userModel = await userInfoApi.fetchUserInfo(params);
      return Right(userModel.toEntity());
    } catch (e) {
      // Handle different types of errors
      if (e.toString().contains('401')) {
        return const Left(
          AuthenticationFailure(
            message: 'Authentication failed. Please login again.',
          ),
        );
      } else if (e.toString().contains('Network')) {
        return const Left(
          NetworkFailure(
            message: 'Network error. Please check your connection.',
          ),
        );
      } else {
        return Left(
          ServerFailure(message: 'Failed to fetch user info: ${e.toString()}'),
        );
      }
    }

    // return User(
    //   name: userModel.name,
    //   email: userModel.email,
    //   avatarUrl: userModel.avatarUrl,
    // );
  }
}
