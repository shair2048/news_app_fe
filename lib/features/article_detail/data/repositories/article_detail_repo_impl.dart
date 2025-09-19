import 'package:dartz/dartz.dart';
import 'package:news_app_fe/core/errors/failures.dart';
import 'package:news_app_fe/features/article_detail/data/data_sources/remote/abstract_article_detail_api.dart';
import 'package:news_app_fe/features/article_detail/domain/entities/article_detail.dart';
import 'package:news_app_fe/features/article_detail/domain/repositories/abstract_article_detail_repo.dart';

class ArticleDetailRepositoryImpl implements AbstractArticleDetailRepository {
  final AbstractArticleDetailApi articleDetailApi;

  ArticleDetailRepositoryImpl(this.articleDetailApi);

  @override
  Future<Either<Failure, ArticleDetail>> getArticleDetail(articleId) async {
    try {
      final articleDetailModel = await articleDetailApi.showArticleDetail(
        articleId,
      );

      return Right(articleDetailModel.toEntity());
    } catch (e) {
      // Handle different types of errors
      if (e.toString().contains('401')) {
        return const Left(
          AuthenticationFailure(
            message: 'Authentication failed. Please login again.',
          ),
        );
      } else if (e.toString().contains('Network')) {
        return const Left(
          NetworkFailure(
            message: 'Network error. Please check your connection.',
          ),
        );
      } else {
        return Left(
          ServerFailure(message: 'Failed to fetch user info: ${e.toString()}'),
        );
      }
    }
  }
}
