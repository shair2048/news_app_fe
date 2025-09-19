import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/features/article_detail/data/model/article_detail_model.dart';
import 'package:news_app_fe/features/article_detail/data/data_sources/remote/abstract_article_detail_api.dart';

class ArticleDetailImplApi implements AbstractArticleDetailApi {
  final ApiService apiService;

  ArticleDetailImplApi(this.apiService);

  @override
  Future<ArticleDetailModel> showArticleDetail(articleId) async {
    final response = await apiService.getData('/articles/$articleId');

    if (response.statusCode == 200) {
      final data = response.data;

      if (data['success'] == true && data['data'] != null) {
        return ArticleDetailModel.fromJson(data['data']);
      } else {
        throw Exception(
          'Invalid response format: ${data['message'] ?? 'Unknown error'}',
        );
      }
    } else {
      throw Exception('HTTP ${response.statusCode}: ${response.statusMessage}');
    }
  }
}
