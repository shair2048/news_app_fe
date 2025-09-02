import 'package:dartz/dartz.dart';
import 'package:news_app_fe/core/errors/failures.dart';
import 'package:news_app_fe/features/home/domain/entities/article.dart';
import 'package:news_app_fe/features/home/domain/repositories/abtract_home_repo.dart';

class GetArticles {
  final AbstractHomeRepository homeRepository;

  GetArticles(this.homeRepository);

  Future<Either<Failure, List<Article>>> call() async {
    return await homeRepository.getArticles();
  }
}
