import 'package:news_app_fe/features/article_detail/data/model/article_detail_model.dart';

abstract class AbstractArticleDetailApi {
  Future<ArticleDetailModel> showArticleDetail(articleId);
}
