import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/news_detail_model.dart';

final newsProvider = Provider<NewsViewModel>((ref) => NewsViewModel());

class NewsViewModel {
  NewsModel getNewsDetail() {
    return NewsModel(
      title:
          'How to Become an Interior Designer (and What You Need to Know Before You Do)',
      imageUrl: 'assets/icons/avatar.svg',
      authorName: 'John Doe',
      authorImage: 'assets/icons/avatar.svg',
      publishedDate: 'July 10, 2025',
      content:
          'What is an Interior Designer? Donec at elit a sem tincidunt interdum in sed quam. In fringilla, massa eget sagittis viverra, sapien tellus mollis libero, nec ullamcorper purus quam ac turpis. '
          'Integer id est ut nibh posuere feugiat sit amet at turpis. Ut turpis quam, posuere eu malesuada quis, dapibus nec ligula. Etiam porta lacus nec luctus luctus. Nullam ut vulputate nunc, eu ultrices velit. Morbi sagittis interdum arcu eu feugiat. Nam interdum justo risus,',
      likes: 123,
      comments: 45,
    );
  }
}
