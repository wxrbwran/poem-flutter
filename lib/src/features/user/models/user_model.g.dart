// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      ip: json['ip'] as String,
      bio: json['bio'] as String,
      sex: json['sex'] as int,
      token: json['token'] as String,
      expiredAt: DateTime.parse(json['expiredAt'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'ip': instance.ip,
      'bio': instance.bio,
      'sex': instance.sex,
      'token': instance.token,
      'expiredAt': instance.expiredAt.toIso8601String(),
    };
