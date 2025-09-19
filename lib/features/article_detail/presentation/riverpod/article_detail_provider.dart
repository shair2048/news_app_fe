import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/features/article_detail/data/data_sources/remote/abstract_article_detail_api.dart';
import 'package:news_app_fe/features/article_detail/data/data_sources/remote/article_detail_impl_api.dart';
import 'package:news_app_fe/features/article_detail/data/repositories/article_detail_repo_impl.dart';
import 'package:news_app_fe/features/article_detail/domain/entities/article_detail.dart';
import 'package:news_app_fe/features/article_detail/domain/repositories/abstract_article_detail_repo.dart';
import 'package:news_app_fe/features/article_detail/domain/usecase/get_article_detail.dart';

// API Service provider
final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

// Data source provider
final remoteArticleDetailDataSourceProvider =
    Provider<AbstractArticleDetailApi>((ref) {
      return ArticleDetailImplApi(ref.watch(apiServiceProvider));
    });

// Repository provider
final articleDetailRepositoryProvider =
    Provider<AbstractArticleDetailRepository>((ref) {
      return ArticleDetailRepositoryImpl(
        ref.watch(remoteArticleDetailDataSourceProvider),
      );
    });

// Use case provider
final getArticleDetailUseCaseProvider = Provider<GetArticleDetail>((ref) {
  return GetArticleDetail(ref.watch(articleDetailRepositoryProvider));
});

// Main provider that UI will use
final articleDetailProvider = FutureProvider.family<ArticleDetail, String>((
  ref,
  articleId,
) async {
  final getArticleDetail = ref.watch(getArticleDetailUseCaseProvider);
  final result = await getArticleDetail.call(articleId);

  return result.fold(
    (failure) => throw Exception(failure.message),
    (article) => article,
  );
});
