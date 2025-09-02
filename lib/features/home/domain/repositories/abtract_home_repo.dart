import 'package:dartz/dartz.dart';
import 'package:news_app_fe/core/errors/failures.dart';
import 'package:news_app_fe/features/home/domain/entities/article.dart';

abstract class AbstractHomeRepository {
  Future<Either<Failure, List<Article>>> getArticles();
}
