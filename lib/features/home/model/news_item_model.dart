class NewsItem {
  final String title;
  final String description;
  final String imageUrl;
  final int readCount;

  NewsItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.readCount,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      title: json['title'] as String? ?? '',
      description: json['content'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      readCount: json['readCount'] as int? ?? 0,
    );
  }
}
