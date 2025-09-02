import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/features/home/domain/entities/article.dart';
import 'package:news_app_fe/features/home/presentation/riverpod/latest_articles_provider.dart';

class LatestArticlesNotifier extends AsyncNotifier<List<Article>> {
  List<Article> _allArticles = [];
  int _visibleCount = 5;

  @override
  Future<List<Article>> build() async {
    final getArticles = ref.read(getArticlesProvider);
    final result = await getArticles();

    return result.fold((failure) => throw failure, (articles) {
      articles.sort(
        (firstArticle, secondArticle) =>
            secondArticle.createdAt.compareTo(firstArticle.createdAt),
      );

      _allArticles = articles;

      return _allArticles.take(_visibleCount).toList();
    });
  }

  void loadMore() {
    // Increment the visible count
    _visibleCount += 10;

    // Update state with new data (don't loading again from API)
    state = AsyncValue.data(_allArticles.take(_visibleCount).toList());
  }
}
