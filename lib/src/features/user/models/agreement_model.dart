// 这个文件是 "AgreementModel.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// 必要的：关联 `AgreementModel.dart` 到 Freezed 代码生成器
part 'agreement_model.freezed.dart';
// 可选的：因为 AgreementModel 类是可序列化的，所以我们必须添加这一行。
// 但是如果 AgreementModel 不是可序列化的，我们可以跳过它。
part 'agreement_model.g.dart';

@freezed
class AgreementModel with _$AgreementModel {
  const factory AgreementModel({
    required int id,
    required String content,
    required int kind,
    required DateTime createdAt,
  }) = _AgreementModel;

  factory AgreementModel.fromJson(Map<String, Object?> json)
  => _$AgreementModelFromJson(json);
}