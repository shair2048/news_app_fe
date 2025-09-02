import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/shared/presentation/widgets/common_app_bar.dart';
import '../widgets/news_author_infor.dart';
import '../widgets/news_content_section.dart';
import '../widgets/news_header.dart';
import 'package:news_app_fe/features/home/presentation/widgets/latest_articles.dart';
import 'package:news_app_fe/features/news_detail/viewmodel/news_detail_viewmodel.dart';

class NewsDetailPage extends ConsumerWidget {
  const NewsDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(newsProvider).getNewsDetail();

    return Scaffold(
      appBar: const CommonAppBar(appBarTitle: 'News Detail'),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          NewsHeader(title: news.title),
          const SizedBox(height: 24),
          NewsAuthorInfo(
            // authorImage: news.authorImage,
            // authorName: news.authorName,
            publishedDate: news.createdAt,
          ),
          const SizedBox(height: 24),
          NewsContentSection(content: news.description),
          const SizedBox(height: 24),
          // NewsFeedbackSection(likes: news.likes, comments: news.comments),
          const SizedBox(height: 32),
          LatestNews(),
        ],
      ),
    );
  }
}
