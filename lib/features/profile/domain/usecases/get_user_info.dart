import 'package:news_app_fe/features/profile/domain/entities/user.dart';
import 'package:news_app_fe/features/profile/domain/entities/user_info_params.dart';
import 'package:news_app_fe/features/profile/domain/repositories/abstract_user_info_repo.dart';

class GetUserInfo {
  final AbstractUserInfoRepository repository;

  GetUserInfo(this.repository);

  Future<User> call(UserInfoParams params) async {
    return await repository.getUserInfo(params);
  }
}
