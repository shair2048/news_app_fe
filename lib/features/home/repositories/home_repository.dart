import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/features/home/model/news_item_model.dart';

class AuthRepository {
  final ApiService api;

  AuthRepository(this.api);

  Future<List<NewsItem>> showNews() async {
    final response = await api.getData('/news');
    final List newsInfo = response.data;

    return newsInfo.map((item) => NewsItem.fromJson(item)).toList();
  }
}
