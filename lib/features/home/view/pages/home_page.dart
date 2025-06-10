import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/features/home/view/widgets/most_read.dart';
import 'package:news_app_fe/features/home/view/widgets/search_app_bar.dart';
import 'package:news_app_fe/features/home/view/widgets/top_category.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          Text('TOP CATEGORY'),
          const SizedBox(height: 16.0),
          Text('MOST READ'),
          const SizedBox(height: 16.0),
          // Add more widgets here as needed
        ],
      ),
    );
  }
}
