// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TemplateModel _$TemplateModelFromJson(Map<String, dynamic> json) {
  return _TemplateModel.fromJson(json);
}

/// @nodoc
mixin _$TemplateModel {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get creatorName => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  int get colorValue => throw _privateConstructorUsedError;
  double get offsetX => throw _privateConstructorUsedError;
  double get offsetY => throw _privateConstructorUsedError;
  Shape get shape => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateModelCopyWith<TemplateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateModelCopyWith<$Res> {
  factory $TemplateModelCopyWith(
          TemplateModel value, $Res Function(TemplateModel) then) =
      _$TemplateModelCopyWithImpl<$Res, TemplateModel>;
  @useResult
  $Res call(
      {String? id,
      String name,
      String creatorName,
      String creatorId,
      int colorValue,
      double offsetX,
      double offsetY,
      Shape shape});
}

/// @nodoc
class _$TemplateModelCopyWithImpl<$Res, $Val extends TemplateModel>
    implements $TemplateModelCopyWith<$Res> {
  _$TemplateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? creatorName = null,
    Object? creatorId = null,
    Object? colorValue = null,
    Object? offsetX = null,
    Object? offsetY = null,
    Object? shape = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      creatorName: null == creatorName
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      colorValue: null == colorValue
          ? _value.colorValue
          : colorValue // ignore: cast_nullable_to_non_nullable
              as int,
      offsetX: null == offsetX
          ? _value.offsetX
          : offsetX // ignore: cast_nullable_to_non_nullable
              as double,
      offsetY: null == offsetY
          ? _value.offsetY
          : offsetY // ignore: cast_nullable_to_non_nullable
              as double,
      shape: null == shape
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as Shape,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TemplateModelCopyWith<$Res>
    implements $TemplateModelCopyWith<$Res> {
  factory _$$_TemplateModelCopyWith(
          _$_TemplateModel value, $Res Function(_$_TemplateModel) then) =
      __$$_TemplateModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String creatorName,
      String creatorId,
      int colorValue,
      double offsetX,
      double offsetY,
      Shape shape});
}

/// @nodoc
class __$$_TemplateModelCopyWithImpl<$Res>
    extends _$TemplateModelCopyWithImpl<$Res, _$_TemplateModel>
    implements _$$_TemplateModelCopyWith<$Res> {
  __$$_TemplateModelCopyWithImpl(
      _$_TemplateModel _value, $Res Function(_$_TemplateModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? creatorName = null,
    Object? creatorId = null,
    Object? colorValue = null,
    Object? offsetX = null,
    Object? offsetY = null,
    Object? shape = null,
  }) {
    return _then(_$_TemplateModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      creatorName: null == creatorName
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      colorValue: null == colorValue
          ? _value.colorValue
          : colorValue // ignore: cast_nullable_to_non_nullable
              as int,
      offsetX: null == offsetX
          ? _value.offsetX
          : offsetX // ignore: cast_nullable_to_non_nullable
              as double,
      offsetY: null == offsetY
          ? _value.offsetY
          : offsetY // ignore: cast_nullable_to_non_nullable
              as double,
      shape: null == shape
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as Shape,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TemplateModel implements _TemplateModel {
  const _$_TemplateModel(
      {this.id,
      this.name = '',
      this.creatorName = '',
      this.creatorId = '',
      this.colorValue = 0,
      this.offsetX = 0,
      this.offsetY = 0,
      this.shape = Shape.circle});

  factory _$_TemplateModel.fromJson(Map<String, dynamic> json) =>
      _$$_TemplateModelFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String creatorName;
  @override
  @JsonKey()
  final String creatorId;
  @override
  @JsonKey()
  final int colorValue;
  @override
  @JsonKey()
  final double offsetX;
  @override
  @JsonKey()
  final double offsetY;
  @override
  @JsonKey()
  final Shape shape;

  @override
  String toString() {
    return 'TemplateModel(id: $id, name: $name, creatorName: $creatorName, creatorId: $creatorId, colorValue: $colorValue, offsetX: $offsetX, offsetY: $offsetY, shape: $shape)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TemplateModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.creatorName, creatorName) ||
                other.creatorName == creatorName) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.colorValue, colorValue) ||
                other.colorValue == colorValue) &&
            (identical(other.offsetX, offsetX) || other.offsetX == offsetX) &&
            (identical(other.offsetY, offsetY) || other.offsetY == offsetY) &&
            (identical(other.shape, shape) || other.shape == shape));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, creatorName, creatorId,
      colorValue, offsetX, offsetY, shape);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TemplateModelCopyWith<_$_TemplateModel> get copyWith =>
      __$$_TemplateModelCopyWithImpl<_$_TemplateModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TemplateModelToJson(
      this,
    );
  }
}

abstract class _TemplateModel implements TemplateModel {
  const factory _TemplateModel(
      {final String? id,
      final String name,
      final String creatorName,
      final String creatorId,
      final int colorValue,
      final double offsetX,
      final double offsetY,
      final Shape shape}) = _$_TemplateModel;

  factory _TemplateModel.fromJson(Map<String, dynamic> json) =
      _$_TemplateModel.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String get creatorName;
  @override
  String get creatorId;
  @override
  int get colorValue;
  @override
  double get offsetX;
  @override
  double get offsetY;
  @override
  Shape get shape;
  @override
  @JsonKey(ignore: true)
  _$$_TemplateModelCopyWith<_$_TemplateModel> get copyWith =>
      throw _privateConstructorUsedError;
}
