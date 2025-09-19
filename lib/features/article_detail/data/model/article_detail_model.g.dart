// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleDetailModel _$ArticleDetailModelFromJson(Map<String, dynamic> json) =>
    ArticleDetailModel(
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrl: json['imageUrl'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ArticleDetailModelToJson(ArticleDetailModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt,
    };
