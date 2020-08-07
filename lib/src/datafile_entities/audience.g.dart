part of 'audience.dart';

Audience _$AudienceFromJson(Map<String, dynamic> json) {
  return Audience(
    json['id'] as String,
    json['name'] as String,
    json['conditions'],
  );
}

Map<String, dynamic> _$AudienceToJson(Audience instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'conditions': instance.conditions,
    };
