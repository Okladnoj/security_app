import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_model.freezed.dart';
part 'template_model.g.dart';

enum Shape {
  triangle,
  circle,
  square;
}

@immutable
@freezed
class TemplateModel with _$TemplateModel {
  const factory TemplateModel({
    String? id,
    @Default('') String name,
    @Default('') String creatorName,
    @Default('') String creatorId,
    @Default(0) int colorValue,
    @Default(0) double offsetX,
    @Default(0) double offsetY,
    @Default(Shape.circle) Shape shape,
  }) = _TemplateModel;

  factory TemplateModel.fromJson(Map<String, dynamic> json) =>
      _$TemplateModelFromJson(json);
}
