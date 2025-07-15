class NewsModel {
  final String title;
  final String imageUrl;
  final String authorName;
  final String authorImage;
  final String publishedDate;
  final String content;
  final int likes;
  final int comments;

  NewsModel({
    required this.title,
    required this.imageUrl,
    required this.authorName,
    required this.authorImage,
    required this.publishedDate,
    required this.content,
    required this.likes,
    required this.comments,
  });
}