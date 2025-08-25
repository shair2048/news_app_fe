import 'package:news_app_fe/features/profile/domain/entities/user.dart';
import 'package:news_app_fe/features/profile/domain/entities/user_info_params.dart';

abstract class AbstractUserInfoRepository {
  Future<User> getUserInfo(UserInfoParams params);
}
