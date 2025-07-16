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

final loadMoreProvider = StateProvider<bool>((ref) => false);

class MostReadViewmodel extends AsyncNotifier<List<NewsItem>> {
  List<NewsItem> _allNews = [];
  int _visibleCount = 5;

  @override
  Future<List<NewsItem>> build() async {
    final homeRepository = ref.read(homeRepositoryProvider);
    final allNews = await homeRepository.showNews();

    allNews.sort(
      (firstNews, secondNews) =>
          secondNews.readCount.compareTo(firstNews.readCount),
    );
    _allNews = allNews;

    return _allNews.take(_visibleCount).toList();
  }

  void loadMore() {
    // Increment the visible count
    _visibleCount += 10;

    // Update state with new data (don't loading again from API)
    state = AsyncValue.data(_allNews.take(_visibleCount).toList());
  }

  // bool get hasMore => _visibleCount < _allNews.length;
}
