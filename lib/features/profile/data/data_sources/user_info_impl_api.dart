import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/features/profile/data/data_sources/abstract_user_info_api.dart';
import 'package:news_app_fe/features/profile/data/models/user_model.dart';
import 'package:news_app_fe/features/profile/domain/entities/user_info_params.dart';

class UserInfoImplApi implements AbstractUserInfoApi {
  final ApiService api;

  UserInfoImplApi(this.api);

  @override
  Future<UserModel> fetchUserInfo(UserInfoParams userParams) async {
    final response = await api.getData(
      '/users/${userParams.userId}',
      headers: {'Authorization': 'Bearer ${userParams.accessToken}'},
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data['data']);
    } else {
      throw Exception(
        'Failed to fetch profile info: ${response.data['success']}',
      );
    }
  }
}
