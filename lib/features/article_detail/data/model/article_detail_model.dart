import 'package:json_annotation/json_annotation.dart';
import 'package:news_app_fe/features/article_detail/domain/entities/article_detail.dart';

part 'article_detail_model.g.dart';

@JsonSerializable()
class ArticleDetailModel {
  final String title;
  final String content;
  final String imageUrl;
  final String createdAt;

  ArticleDetailModel({
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.createdAt,
  });

  factory ArticleDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleDetailModelFromJson(json);

  ArticleDetail toEntity() {
    return ArticleDetail(
      title: title,
      content: content,
      imageUrl: imageUrl,
      createdAt: createdAt,
    );
  }
}
