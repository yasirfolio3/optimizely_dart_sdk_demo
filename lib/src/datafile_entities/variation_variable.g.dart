part of 'variation_variable.dart';

VariationVariable _$VariationVariableFromJson(Map<String, dynamic> json) {
  return VariationVariable(
    json['id'] as String,
    json['value'] as String,
  );
}

Map<String, dynamic> _$VariationVariableToJson(VariationVariable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };
