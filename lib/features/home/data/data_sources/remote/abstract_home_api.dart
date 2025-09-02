import 'package:news_app_fe/features/home/data/model/article_model.dart';

abstract class AbstractHomeApi {
  Future<List<ArticleModel>> fetchArticles();
}
