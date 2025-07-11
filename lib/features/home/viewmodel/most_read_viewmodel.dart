import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/features/home/model/news_item_model.dart';
import 'package:news_app_fe/features/home/repositories/home_repository.dart';

final apiServiceProvider = Provider<ApiService>(
  (ref) => ApiService(), // Inject ApiService
);

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return HomeRepositoryImpl(apiService);
});

final newsViewModelProvider =
    AsyncNotifierProvider<MostReadViewmodel, List<NewsItem>>(
      () => MostReadViewmodel(),
    );

class MostReadViewmodel extends AsyncNotifier<List<NewsItem>> {
  @override
  Future<List<NewsItem>> build() async {
    return getNews();
  }

  Future<List<NewsItem>> getNews() async {
    final homeRepository = ref.read(homeRepositoryProvider);
    final newsList = await homeRepository.showNews();
    newsList.sort(
      (firstItem, secondItem) =>
          secondItem.readCount.compareTo(firstItem.readCount),
    );
    final topNews = newsList.take(5).toList();
    state = AsyncData(topNews);
    return topNews;
  }

  // Future<void> loadNews() async {
  //   state = const AsyncLoading();
  //   try {
  //     final newsList = await getNews();
  //     state = AsyncData(newsList);
  //   } catch (error) {
  //     state = AsyncError(error);
  //   }
  // }
}
