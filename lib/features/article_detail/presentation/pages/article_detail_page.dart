import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/features/article_detail/presentation/riverpod/article_detail_provider.dart';
import 'package:news_app_fe/shared/presentation/widgets/common_app_bar.dart';
import '../widgets/article_author_infor.dart';
import '../widgets/article_content_section.dart';
import '../widgets/article_header.dart';
import 'package:news_app_fe/features/home/presentation/widgets/latest_articles.dart';

class ArticleDetailPage extends ConsumerWidget {
  final String articleId;

  const ArticleDetailPage({super.key, required this.articleId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleState = ref.watch(articleDetailProvider(articleId));

    return Scaffold(
      appBar: const CommonAppBar(appBarTitle: 'News Detail'),
      backgroundColor: Colors.white,

      body: articleState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, stackTrace) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Oops! Something went wrong',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    error.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      ref.invalidate(articleDetailProvider(articleId));
                    },
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            ),

        data:
            (article) => ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              children: [
                ArticleHeader(title: article.title, imageUrl: article.imageUrl),
                const SizedBox(height: 24),
                ArticleAuthorInfo(publishedDate: article.createdAt),
                const SizedBox(height: 24),
                ArticleContentSection(content: article.content),
                const SizedBox(height: 32),
                const LatestNews(),
              ],
            ),
      ),
    );
  }
}
