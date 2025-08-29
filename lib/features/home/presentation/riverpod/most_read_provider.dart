import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/features/home/data/data_sources/remote/abstract_home_api.dart';
import 'package:news_app_fe/features/home/data/data_sources/remote/home_impl_api.dart';
import 'package:news_app_fe/features/home/data/repositories/home_repo_impl.dart';
import 'package:news_app_fe/features/home/domain/entities/article.dart';
import 'package:news_app_fe/features/home/domain/repositories/abtract_home_repo.dart';
import 'package:news_app_fe/features/home/domain/usecases/get_articles.dart';
import 'package:news_app_fe/features/home/presentation/riverpod/most_read_notifier.dart';

// Inject ApiService
final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final homeApiProvider = Provider<AbstractHomeApi>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return HomeImplApi(apiService);
});

final homeRepositoryProvider = Provider<AbstractHomeRepository>((ref) {
  final api = ref.read(homeApiProvider);
  return HomeRepositoryImpl(api);
});

final getArticlesProvider = Provider<GetArticles>((ref) {
  final repo = ref.read(homeRepositoryProvider);
  return GetArticles(repo);
});

final mostReadNotifierProvider =
    AsyncNotifierProvider<MostReadNotifier, List<Article>>(
      () => MostReadNotifier(),
    );

final loadMoreProvider = StateProvider<bool>((ref) => false);
