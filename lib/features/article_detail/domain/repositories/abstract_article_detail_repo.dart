import 'package:dartz/dartz.dart';
import 'package:news_app_fe/core/errors/failures.dart';
import 'package:news_app_fe/features/article_detail/domain/entities/article_detail.dart';

abstract class AbstractArticleDetailRepository {
  Future<Either<Failure, ArticleDetail>> getArticleDetail(articleId);
}
