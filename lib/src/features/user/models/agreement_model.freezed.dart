// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agreement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AgreementModel _$AgreementModelFromJson(Map<String, dynamic> json) {
  return _AgreementModel.fromJson(json);
}

/// @nodoc
mixin _$AgreementModel {
  int get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int get kind => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgreementModelCopyWith<AgreementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgreementModelCopyWith<$Res> {
  factory $AgreementModelCopyWith(
          AgreementModel value, $Res Function(AgreementModel) then) =
      _$AgreementModelCopyWithImpl<$Res, AgreementModel>;
  @useResult
  $Res call({int id, String content, int kind, DateTime createdAt});
}

/// @nodoc
class _$AgreementModelCopyWithImpl<$Res, $Val extends AgreementModel>
    implements $AgreementModelCopyWith<$Res> {
  _$AgreementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? kind = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgreementModelImplCopyWith<$Res>
    implements $AgreementModelCopyWith<$Res> {
  factory _$$AgreementModelImplCopyWith(_$AgreementModelImpl value,
          $Res Function(_$AgreementModelImpl) then) =
      __$$AgreementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String content, int kind, DateTime createdAt});
}

/// @nodoc
class __$$AgreementModelImplCopyWithImpl<$Res>
    extends _$AgreementModelCopyWithImpl<$Res, _$AgreementModelImpl>
    implements _$$AgreementModelImplCopyWith<$Res> {
  __$$AgreementModelImplCopyWithImpl(
      _$AgreementModelImpl _value, $Res Function(_$AgreementModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? kind = null,
    Object? createdAt = null,
  }) {
    return _then(_$AgreementModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgreementModelImpl
    with DiagnosticableTreeMixin
    implements _AgreementModel {
  const _$AgreementModelImpl(
      {required this.id,
      required this.content,
      required this.kind,
      required this.createdAt});

  factory _$AgreementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgreementModelImplFromJson(json);

  @override
  final int id;
  @override
  final String content;
  @override
  final int kind;
  @override
  final DateTime createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AgreementModel(id: $id, content: $content, kind: $kind, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AgreementModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('kind', kind))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgreementModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, kind, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AgreementModelImplCopyWith<_$AgreementModelImpl> get copyWith =>
      __$$AgreementModelImplCopyWithImpl<_$AgreementModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgreementModelImplToJson(
      this,
    );
  }
}

abstract class _AgreementModel implements AgreementModel {
  const factory _AgreementModel(
      {required final int id,
      required final String content,
      required final int kind,
      required final DateTime createdAt}) = _$AgreementModelImpl;

  factory _AgreementModel.fromJson(Map<String, dynamic> json) =
      _$AgreementModelImpl.fromJson;

  @override
  int get id;
  @override
  String get content;
  @override
  int get kind;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$AgreementModelImplCopyWith<_$AgreementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
