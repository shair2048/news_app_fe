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
    final news = ref.watch(articleProvider).getNewsDetail();

    return Scaffold(
      appBar: const CommonAppBar(appBarTitle: 'News Detail'),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          ArticleHeader(title: news.title),
          const SizedBox(height: 24),
          ArticleAuthorInfo(
            // authorImage: news.authorImage,
            // authorName: news.authorName,
            publishedDate: news.createdAt,
          ),
          const SizedBox(height: 24),
          ArticleContentSection(content: news.description),
          const SizedBox(height: 24),
          // ArticleFeedbackSection(likes: news.likes, comments: news.comments),
          const SizedBox(height: 32),
          LatestNews(),
        ],
      ),
    );
  }
}
