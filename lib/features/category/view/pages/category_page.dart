import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/shared/presentation/widgets/common_app_bar.dart';
import '../../viewmodel/category_viewmodel.dart';
import '../widgets/category_item.dart';

class CategoryPage extends ConsumerWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryProvider);

    return Scaffold(
      appBar: const CommonAppBar(appBarTitle: 'All Category'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.75,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          children:
              categories
                  .map((category) => CategoryItem(category: category))
                  .toList(),
        ),
      ),
    );
  }
}
