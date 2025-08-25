import 'package:news_app_fe/features/profile/data/data_sources/abstract_user_info_api.dart';
import 'package:news_app_fe/features/profile/data/models/user_model.dart';
import 'package:news_app_fe/features/profile/domain/entities/user.dart';
import 'package:news_app_fe/features/profile/domain/entities/user_info_params.dart';
import 'package:news_app_fe/features/profile/domain/repositories/abstract_user_info_repo.dart';

class UserInfoRepositoryImpl implements AbstractUserInfoRepository {
  final AbstractUserInfoApi userInfoApi;

  UserInfoRepositoryImpl(this.userInfoApi);

  @override
  Future<User> getUserInfo(UserInfoParams params) async {
    final UserModel userModel = await userInfoApi.fetchUserInfo(params);

    return User(
      name: userModel.name,
      email: userModel.email,
      avatarUrl: userModel.avatarUrl,
    );
  }
}
