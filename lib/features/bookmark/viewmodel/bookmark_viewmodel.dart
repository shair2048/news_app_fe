import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/bookmark_model.dart';

final bookmarkViewModelProvider = Provider<BookmarkViewModel>(
  (ref) => BookmarkViewModel(),
);

class BookmarkViewModel {
  List<BookmarkModel> getBookmarkedItems() {
    return [
      BookmarkModel(
        imageUrl: 'assets/images/bookmark1.jpg',
        title:
            'Maecenas mattis hendrerit enim ac vestibuluuuuuuuuuuuuuuuuuuuuuuuuuu',
        description:
            'Phasellus interdum neque nunc, non tempor dui auctor eu. Mauris tincidunt tincidunt odio, eu elementum tellus. Curabitur blandit nisl sit amet mauris finibus.',
        views: 25900,
        comments: 657,
      ),
      BookmarkModel(
        imageUrl: 'assets/images/bookmark2.jpg',
        title: 'Maecenas mattis hendrerit enim ac vestibulu...',
        description:
            'Phasellus interdum neque nunc, non tempor dui auctor eu. Mauris tincidunt tincidunt odio, eu elementum tellus. Curabitur blandit nisl sit amet mauris finibus.',
        views: 25900,
        comments: 657,
      ),
      BookmarkModel(
        imageUrl: 'assets/images/bookmark3.jpg',
        title: 'Maecenas mattis hendrerit enim ac vestibulu...',
        description:
            'Phasellus interdum neque nunc, non tempor dui auctor eu. Mauris tincidunt tincidunt odio, eu elementum tellus. Curabitur blandit nisl sit amet mauris finibus.',
        views: 25900,
        comments: 657,
      ),
    ];
  }

  void onShareTap(BookmarkModel item) {
    print('Chia sẻ: ${item.title}');
  }

  void onBookmarkTap(BookmarkModel item) {
    print('Bookmark/Unbookmark: ${item.title}');
  }
}
