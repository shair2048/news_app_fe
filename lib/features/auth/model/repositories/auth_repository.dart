import 'package:news_app_fe/core/services/api_service.dart';

abstract class AuthRepository {
  Future<void> register({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  });

  Future<String> login(String email, String password);
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
    await api.postData('/auth/register', {
      'name': fullName,
      'email': email,
      'password': password,
    });
  }

  @override
  Future<String> login(String email, String password) async {
    final res = await api.postData('/auth/login', {
      'email': email,
      'password': password,
    });

    if (res.statusCode == 200) {
      final token = res.data['token'];
      return token;
    } else {
      throw Exception('Login failed: ${res.data['message']}');
    }
  }
}
