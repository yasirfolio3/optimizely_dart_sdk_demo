import 'package:json_annotation/json_annotation.dart';
part 'attribute.g.dart';

@JsonSerializable()
class Attribute {
  final String id;
  final String key;

  Attribute(this.id, this.key);

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);
}
