import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/features/home/model/news_item_model.dart';

abstract class HomeRepository {
  Future<List<NewsItem>> showNews();
}

class HomeRepositoryImpl implements HomeRepository {
  final ApiService api;

  HomeRepositoryImpl(this.api);

  @override
  Future<List<NewsItem>> showNews() async {
    final response = await api.getData('/news');
    final List newsInfo = response.data;

    return newsInfo.map((item) => NewsItem.fromJson(item)).toList();
  }
}
