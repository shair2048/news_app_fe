import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/core/widgets/common_app_bar.dart';
import 'package:news_app_fe/features/home/view/widgets/most_read.dart';
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
      appBar: CommonAppBar(appBarTitle: 'Home'),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Top Category
            TopCategory(),
            MostRead(),
          ],
        ),
      ),
    );
  }
}
