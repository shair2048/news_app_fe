class Article {
  final String newsId;
  final String title;
  final String content;
  final String imageUrl;
  final int readCount;
  final String createdAt;

  Article({
    required this.newsId,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.readCount,
    required this.createdAt,
  });
}
