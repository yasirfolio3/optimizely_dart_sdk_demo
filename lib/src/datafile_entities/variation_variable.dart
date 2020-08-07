part 'variation_variable.g.dart';

class VariationVariable {
  final String id;
  final String value;

  VariationVariable(this.id, this.value);

  factory VariationVariable.fromJson(Map<String, dynamic> json) =>
      _$VariationVariableFromJson(json);

  Map<String, dynamic> toJson() => _$VariationVariableToJson(this);
}
