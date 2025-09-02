import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/features/home/data/model/article_model.dart';

abstract class NewsDetailRepository {
  Future<List<ArticleModel>> showNews();
}

class NewsDetailRepositoryImpl implements NewsDetailRepository {
  final ApiService api;

  NewsDetailRepositoryImpl(this.api);

  @override
  Future<List<ArticleModel>> showNews() async {
    final response = await api.getData('/news');
    final List newsInfo = response.data;

    return newsInfo.map((item) => ArticleModel.fromJson(item)).toList();
  }
}
