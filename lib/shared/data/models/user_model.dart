import 'package:json_annotation/json_annotation.dart';
import 'package:news_app_fe/shared/domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String email;
  final String? avatarUrl;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  User toEntity() {
    return User(id: id, name: name, email: email, avatarUrl: avatarUrl);
  }
}
