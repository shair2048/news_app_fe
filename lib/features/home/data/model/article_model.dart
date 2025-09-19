import 'package:json_annotation/json_annotation.dart';
import 'package:news_app_fe/features/home/domain/entities/article.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  @JsonKey(name: '_id')
  final String articleId;
  final String title;
  final String content;
  final String imageUrl;
  final int readCount;
  final String createdAt;

  ArticleModel({
    required this.articleId,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.readCount,
    required this.createdAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);

  Article toEntity() {
    return Article(
      articleId: articleId,
      title: title,
      content: content,
      imageUrl: imageUrl,
      readCount: readCount,
      createdAt: createdAt,
    );
  }
}
