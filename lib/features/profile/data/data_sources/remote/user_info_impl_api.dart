import 'package:dio/dio.dart';
import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/features/profile/data/data_sources/remote/abstract_user_info_api.dart';
import 'package:news_app_fe/features/profile/data/models/user_model.dart';
import 'package:news_app_fe/features/profile/domain/entities/user_info_params.dart';

class UserInfoImplApi implements AbstractUserInfoApi {
  final ApiService apiService;

  UserInfoImplApi(this.apiService);

  @override
  Future<UserModel> fetchUserInfo(UserInfoParams userParams) async {
    try {
      final response = await apiService.getData(
        '/users/${userParams.userId}',
        headers: {'Authorization': 'Bearer ${userParams.accessToken}'},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['success'] == true && data['data'] != null) {
          return UserModel.fromJson(data['data']);
        } else {
          throw Exception(
            'Invalid response format: ${data['message'] ?? 'Unknown error'}',
          );
        }
      } else {
        throw Exception(
          'HTTP ${response.statusCode}: ${response.statusMessage}',
        );
      }
    } on DioException catch (e) {
      switch (e.response?.statusCode) {
        case 401:
          throw Exception('Authentication failed: Invalid or expired token');
        case 404:
          throw Exception('User not found');
        case 500:
          throw Exception('Server error: Please try again later');
        default:
          throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
