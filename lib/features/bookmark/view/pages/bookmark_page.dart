import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/shared/presentation/widgets/common_app_bar.dart';
import '../../viewmodel/bookmark_viewmodel.dart';
import '../../view/widgets/bookmark_item.dart';

class BookmarkPage extends ConsumerWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkViewModel = ref.watch(bookmarkViewModelProvider);
    final bookmarkedItems = bookmarkViewModel.getBookmarkedItems();
    return Scaffold(
      appBar: const CommonAppBar(appBarTitle: 'Bookmark'),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 30),
        itemCount: bookmarkedItems.length,
        itemBuilder: (context, index) {
          final item = bookmarkedItems[index];
          return BookmarkItem(
            bookmarkItem: item,
            // onShare: () => bookmarkViewModel.onShareTap(item),
            onBookmark: () => bookmarkViewModel.onBookmarkTap(item),
          );
        },
      ),
    );
  }
}
