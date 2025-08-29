import 'package:dartz/dartz.dart';
import 'package:news_app_fe/core/errors/failures.dart';
import 'package:news_app_fe/features/home/data/data_sources/remote/abstract_home_api.dart';
import 'package:news_app_fe/features/home/domain/entities/article.dart';
import 'package:news_app_fe/features/home/domain/repositories/abtract_home_repo.dart';

class HomeRepositoryImpl implements AbstractHomeRepository {
  final AbstractHomeApi homeApi;

  HomeRepositoryImpl(this.homeApi);

  @override
  Future<Either<Failure, List<Article>>> getArticles() async {
    try {
      final newsItemModel = await homeApi.fetchArticles();
      return Right(newsItemModel.map((model) => model.toEntity()).toList());
    } catch (e) {
      return Left(
        ServerFailure(message: 'Failed to fetch articles: ${e.toString()}'),
      );
    }
  }
}
