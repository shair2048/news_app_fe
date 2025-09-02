import 'package:news_app_fe/features/auth/data/model/auth_response_model.dart';

abstract class AbstractAuthApi {
  Future<AuthResponseModel> register({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  });

  Future<AuthResponseModel> login(String email, String password);
}
