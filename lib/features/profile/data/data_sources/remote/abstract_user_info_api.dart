import 'package:news_app_fe/features/profile/data/models/profile_response_model.dart';
import 'package:news_app_fe/features/profile/domain/entities/user_info_params.dart';

abstract class AbstractUserInfoApi {
  Future<ProfileResponseModel> fetchUserInfo(UserInfoParams userParams);
}
