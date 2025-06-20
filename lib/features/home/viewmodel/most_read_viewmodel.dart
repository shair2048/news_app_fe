import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/core/services/api_service.dart';
import 'package:news_app_fe/features/home/model/news_item_model.dart';
import 'package:news_app_fe/features/home/repositories/home_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final apiService = ApiService();
  return AuthRepository(apiService);
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
    final repository = ref.read(authRepositoryProvider);
    final newsList = await repository.showNews();
    state = AsyncData(newsList);
    return newsList;
  }
}
