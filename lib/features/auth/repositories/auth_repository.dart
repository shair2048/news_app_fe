import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/features/auth/model/login_result_model.dart';

abstract class AuthRepository {
  Future<void> register({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  });

  Future<LoginResult> login(String email, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  final ApiService api;

  AuthRepositoryImpl(this.api);

  @override
  Future<void> register({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    await api.postData('/auth/sign-up', {
      'name': fullName,
      'email': email,
      'password': password,
    });
  }

  @override
  Future<LoginResult> login(String email, String password) async {
    final res = await api.postData('/auth/sign-in', {
      'email': email,
      'password': password,
    });

    if (res.statusCode == 200) {
      final data = res.data['data'];
      if (data != null && data['token'] != null && data['user'] != null) {
        return LoginResult.fromJson(data);
      } else {
        throw Exception('Login failed: Missing token or user information');
      }
      // return token;
    } else {
      throw Exception('Login failed: ${res.data['message']}');
    }
  }
}
