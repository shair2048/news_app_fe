// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
  newsId: json['_id'] as String,
  title: json['title'] as String,
  content: json['content'] as String,
  imageUrl: json['imageUrl'] as String,
  readCount: (json['readCount'] as num).toInt(),
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      '_id': instance.newsId,
      'title': instance.title,
      'content': instance.content,
      'imageUrl': instance.imageUrl,
      'readCount': instance.readCount,
      'createdAt': instance.createdAt,
    };
