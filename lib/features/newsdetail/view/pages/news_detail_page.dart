import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/core/widgets/common_app_bar.dart';
import '../widgets/news_author_infor.dart';
import '../widgets/news_content_section.dart';
import '../../view/widgets/news_feedback_section.dart';
import '../../view/widgets/news_header.dart';
import 'package:news_app_fe/features/home/view/widgets/latest_news.dart';
import 'package:news_app_fe/features/newsdetail/viewmodel/news_detail_viewmodel.dart';

class NewsDetailPage extends ConsumerWidget {
  const NewsDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(newsProvider).getNewsDetail();

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: const CommonAppBar(appBarTitle: 'News Detail'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewsHeader(
              title: news.title,
              imageUrl: news.imageUrl,
            ),
            const SizedBox(height: 16),
            NewsAuthorInfo(
              authorImage: news.authorImage,
              authorName: news.authorName,
              publishedDate: news.publishedDate,
            ),
            const SizedBox(height: 16),
            NewsContentSection(content: news.content),
            const SizedBox(height: 16),
            NewsFeedbackSection(likes: news.likes, comments: news.comments),
            const SizedBox(height: 32),
            const LatestNews(),
          ],
        ),
      ),
    );
  }
}