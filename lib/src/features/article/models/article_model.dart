// 这个文件是 "ArticleModel.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// 必要的：关联 `ArticleModel.dart` 到 Freezed 代码生成器
part 'article_model.freezed.dart';
// 可选的：因为 ArticleModel 类是可序列化的，所以我们必须添加这一行。
// 但是如果 ArticleModel 不是可序列化的，我们可以跳过它。
part 'article_model.g.dart';

@freezed
class ArticleModel with _$ArticleModel {
  const factory ArticleModel({
    required int id,
    required int kind,
    required int flag,
    required String title,
    required String author,
    required String cover,
    required String content,
    required DateTime createdAt,
    required DateTime updatedAt,
    required bool isDeleted,
    // 用户信息
    required int userId,
    required String name,
    required String avatar,
    required String ip,
  }) = _ArticleModel;

  factory ArticleModel.fromJson(Map<String, Object?> json)
  => _$ArticleModelFromJson(json);
}