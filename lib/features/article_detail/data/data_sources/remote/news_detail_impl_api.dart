import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/features/home/data/model/article_model.dart';
import 'package:news_app_fe/features/article_detail/data/data_sources/remote/abstract_news_detail_api.dart';

class NewsDetailImplApi implements AbstractNewsDetailApi {
  final ApiService apiService;

  NewsDetailImplApi(this.apiService);

  @override
  Future<List<ArticleModel>> showNews() async {
    final response = await apiService.getData('/news/:id');
    final List newsInfo = response.data;

    return newsInfo.map((item) => ArticleModel.fromJson(item)).toList();
  }
}
