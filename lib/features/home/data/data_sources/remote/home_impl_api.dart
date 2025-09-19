import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/features/home/data/data_sources/remote/abstract_home_api.dart';
import 'package:news_app_fe/features/home/data/model/article_model.dart';

class HomeImplApi implements AbstractHomeApi {
  final ApiService apiService;

  HomeImplApi(this.apiService);

  @override
  Future<List<ArticleModel>> fetchArticles() async {
    final response = await apiService.getData('/articles');
    final List newsInfo = response.data['data'];

    return newsInfo.map((item) => ArticleModel.fromJson(item)).toList();
  }
}
