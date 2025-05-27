import 'package:news_app_fe/features/auth/model/services/api_service.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository(this.apiService);

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    await apiService.postData('/register', {
      'name': fullName,
      'email': email,
      'password': password,
    });
  }
}
