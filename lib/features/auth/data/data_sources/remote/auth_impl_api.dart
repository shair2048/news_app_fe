import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/features/auth/data/data_sources/remote/abstract_auth_api.dart';
import 'package:news_app_fe/features/auth/data/model/auth_response_model.dart';

class AuthImplApi implements AbstractAuthApi {
  final ApiService apiService;

  AuthImplApi(this.apiService);

  @override
  Future<AuthResponseModel> register({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final res = await apiService.postData('/auth/sign-up', {
      'name': fullName,
      'email': email,
      'password': password,
    });

    if (res.statusCode == 201) {
      final data = res.data['data'];
      if (data != null && data['token'] != null && data['user'] != null) {
        return AuthResponseModel.fromJson(data);
      } else {
        throw Exception('Register failed: Missing token or user information');
      }
    } else {
      throw Exception('Register failed: ${res.data['message']}');
    }
  }

  @override
  Future<AuthResponseModel> login(String email, String password) async {
    final res = await apiService.postData('/auth/sign-in', {
      'email': email,
      'password': password,
    });

    if (res.statusCode == 200) {
      final data = res.data['data'];
      if (data != null && data['token'] != null && data['user'] != null) {
        return AuthResponseModel.fromJson(data);
      } else {
        throw Exception('Login failed: Missing token or user information');
      }
    } else {
      throw Exception('Login failed: ${res.data['message']}');
    }
  }
}
