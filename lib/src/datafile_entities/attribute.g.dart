part of 'attribute.dart';

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return Attribute(
    json['id'] as String,
    json['key'] as String,
  );
}

Map<String, dynamic> _$AttributeToJson(Attribute instance) => <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
    };
