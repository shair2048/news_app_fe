import 'package:dartz/dartz.dart';
import 'package:news_app_fe/core/errors/failures.dart';
import 'package:news_app_fe/features/article_detail/domain/entities/article_detail.dart';
import 'package:news_app_fe/features/article_detail/domain/repositories/abstract_article_detail_repo.dart';

class GetArticleDetail {
  final AbstractArticleDetailRepository repository;

  GetArticleDetail(this.repository);

  Future<Either<Failure, ArticleDetail>> call(articleId) async {
    return await repository.getArticleDetail(articleId);
  }
}
