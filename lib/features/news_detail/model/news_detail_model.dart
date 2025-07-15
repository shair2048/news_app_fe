class NewsDetailModel {
  final String title;
  final String description;
  // final String imageUrl;
  // final String authorName;
  // final String authorAvatar;
  final String createdAt;
  // final int likes;
  // final int comments;

  NewsDetailModel({
    required this.title,
    required this.description,
    // required this.imageUrl,
    // required this.authorName,
    // required this.authorAvatar,
    required this.createdAt,
    // required this.likes,
    // required this.comments,
  });

  factory NewsDetailModel.fromJson(Map<String, dynamic> json) {
    return NewsDetailModel(
      title: json['title'] as String? ?? '',
      description: json['content'] as String? ?? '',
      // imageUrl: json['imageUrl'] as String? ?? '',
      // authorName: json['readCount'] as int? ?? 0,
      createdAt: json['createdAt'] as String? ?? '',
    );
  }
}
