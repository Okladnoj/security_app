// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TemplateModel _$$_TemplateModelFromJson(Map<String, dynamic> json) =>
    _$_TemplateModel(
      id: json['id'] as String?,
      name: json['name'] as String? ?? '',
      creatorName: json['creatorName'] as String? ?? '',
      creatorId: json['creatorId'] as String? ?? '',
      colorValue: json['colorValue'] as int? ?? 0,
      offsetX: (json['offsetX'] as num?)?.toDouble() ?? 0,
      offsetY: (json['offsetY'] as num?)?.toDouble() ?? 0,
      shape: $enumDecodeNullable(_$ShapeEnumMap, json['shape']) ?? Shape.circle,
    );

Map<String, dynamic> _$$_TemplateModelToJson(_$_TemplateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'creatorName': instance.creatorName,
      'creatorId': instance.creatorId,
      'colorValue': instance.colorValue,
      'offsetX': instance.offsetX,
      'offsetY': instance.offsetY,
      'shape': _$ShapeEnumMap[instance.shape]!,
    };

const _$ShapeEnumMap = {
  Shape.triangle: 'triangle',
  Shape.circle: 'circle',
  Shape.square: 'square',
};
