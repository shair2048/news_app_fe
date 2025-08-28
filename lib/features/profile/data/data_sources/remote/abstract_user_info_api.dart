import 'package:news_app_fe/features/profile/data/models/user_model.dart';
import 'package:news_app_fe/features/profile/domain/entities/user_info_params.dart';

abstract class AbstractUserInfoApi {
  Future<UserModel> fetchUserInfo(UserInfoParams userParams);
}
