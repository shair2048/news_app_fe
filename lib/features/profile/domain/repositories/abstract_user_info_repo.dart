import 'package:dartz/dartz.dart';
import 'package:news_app_fe/core/errors/failures.dart';
import 'package:news_app_fe/features/profile/domain/entities/user.dart';
import 'package:news_app_fe/features/profile/domain/entities/user_info_params.dart';

abstract class AbstractUserInfoRepository {
  Future<Either<Failure, User>> getUserInfo(UserInfoParams params);
}
