import 'package:dartz/dartz.dart';
import 'package:news_app_fe/core/errors/failures.dart';
import 'package:news_app_fe/features/profile/domain/entities/user.dart';
import 'package:news_app_fe/features/profile/domain/entities/user_info_params.dart';
import 'package:news_app_fe/features/profile/domain/repositories/abstract_user_info_repo.dart';

class GetUserInfo {
  final AbstractUserInfoRepository repository;

  GetUserInfo(this.repository);

  Future<Either<Failure, User>> call(UserInfoParams params) async {
    return await repository.getUserInfo(params);
  }
}
