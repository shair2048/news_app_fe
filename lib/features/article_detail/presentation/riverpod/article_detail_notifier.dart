import '../../data/model/article_detail_model.dart';

class ArticleDetailNotifier {
  NewsDetailModel getNewsDetail() {
    return NewsDetailModel(
      title:
          'How to Become an Interior Designer (and What You Need to Know Before You Do)',
      description:
          'What is an Interior Designer? Donec at elit a sem tincidunt interdum in sed quam. In fringilla, massa eget sagittis viverra, sapien tellus mollis libero, nec ullamcorper purus quam ac turpis. '
          'Integer id est ut nibh posuere feugiat sit amet at turpis. Ut turpis quam, posuere eu malesuada quis, dapibus nec ligula. Etiam porta lacus nec luctus luctus. Nullam ut vulputate nunc, eu ultrices velit. Morbi sagittis interdum arcu eu feugiat. Nam interdum justo risus,',

      // imageUrl: 'assets/icons/avatar.svg',
      // authorName: 'John Doe',
      // authorImage: 'assets/icons/avatar.svg',
      createdAt: 'July 10, 2025',
    );
  }
}
