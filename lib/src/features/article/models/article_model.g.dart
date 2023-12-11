// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleModelImpl _$$ArticleModelImplFromJson(Map<String, dynamic> json) =>
    _$ArticleModelImpl(
      id: json['id'] as int,
      kind: json['kind'] as int,
      flag: json['flag'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
      cover: json['cover'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isDeleted: json['isDeleted'] as bool,
      userId: json['userId'] as int,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      ip: json['ip'] as String,
    );

Map<String, dynamic> _$$ArticleModelImplToJson(_$ArticleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': instance.kind,
      'flag': instance.flag,
      'title': instance.title,
      'author': instance.author,
      'cover': instance.cover,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'userId': instance.userId,
      'name': instance.name,
      'avatar': instance.avatar,
      'ip': instance.ip,
    };
