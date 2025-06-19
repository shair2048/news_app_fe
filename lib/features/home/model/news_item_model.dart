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

  // factory NewsItem.fromJson(Map<String, dynamic> json) {
  //   return NewsItem(
  //     title: json['title'] as String,
  //     description: json['description'] as String,
  //     imageUrl: json['imageUrl'] as String,
  //   );
  // }
}
