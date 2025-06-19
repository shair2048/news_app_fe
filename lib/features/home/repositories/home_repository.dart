import 'package:news_app_fe/core/services/api_service.dart';

class AuthRepository {
  final ApiService api;

  AuthRepository(this.api);

  Future<void> showNews() async {
    await api.getData('/news');
  }
}
