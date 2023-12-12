// 这个文件是 "UserModel.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// 必要的：关联 `UserModel.dart` 到 Freezed 代码生成器
part 'user_model.freezed.dart';
// 可选的：因为 UserModel 类是可序列化的，所以我们必须添加这一行。
// 但是如果 UserModel 不是可序列化的，我们可以跳过它。
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    // 用户信息
    required String name,
    required String avatar,
    required String ip,
    required String bio,
    required int sex,
    required String token,
    required DateTime expiredAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json)
  => _$UserModelFromJson(json);
}