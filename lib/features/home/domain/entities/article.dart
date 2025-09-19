class Article {
  final String articleId;
  final String title;
  final String content;
  final String imageUrl;
  final int readCount;
  final String createdAt;

  Article({
    required this.articleId,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.readCount,
    required this.createdAt,
  });
}
