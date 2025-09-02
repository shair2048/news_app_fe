import 'package:news_app_fe/shared/domain/entities/user.dart';

class AuthResponse {
  final String token;
  final User user;

  AuthResponse({required this.token, required this.user});
}
