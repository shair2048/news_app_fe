import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/features/article_detail/presentation/riverpod/article_detail_notifier.dart';

final articleProvider = Provider<ArticleDetailNotifier>(
  (ref) => ArticleDetailNotifier(),
);
