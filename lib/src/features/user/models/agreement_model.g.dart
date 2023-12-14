// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agreement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgreementModelImpl _$$AgreementModelImplFromJson(Map<String, dynamic> json) =>
    _$AgreementModelImpl(
      id: json['id'] as int,
      content: json['content'] as String,
      kind: json['kind'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AgreementModelImplToJson(
        _$AgreementModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'kind': instance.kind,
      'createdAt': instance.createdAt.toIso8601String(),
    };
