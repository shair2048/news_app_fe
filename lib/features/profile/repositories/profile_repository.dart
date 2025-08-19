import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/features/profile/model/profile_model.dart';

abstract class ProfileRepository {
  Future<ProfileUser> getUserInformation({
    required String userId,
    required String accessToken,
  });
}

class ProfileRepositoryImpl implements ProfileRepository {
  final ApiService api;

  ProfileRepositoryImpl(this.api);

  @override
  Future<ProfileUser> getUserInformation({
    required String userId,
    required String accessToken,
  }) async {
    final response = await api.getData(
      '/users/$userId',
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      // return response.data['success'];
      return ProfileUser(
        name: response.data['data']['name'],
        email: response.data['data']['email'],
      );
    } else {
      throw Exception(
        'Failed to fetch profile info: ${response.data['success']}',
      );
    }
  }
}
