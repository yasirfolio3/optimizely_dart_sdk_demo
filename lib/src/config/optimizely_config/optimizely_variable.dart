part 'optimizely_variable.g.dart';

class OptimizelyVariable {
  String id;
  String key;
  String type;
  String value;

  OptimizelyVariable(this.id, this.key, this.type, this.value);

  factory OptimizelyVariable.fromJson(Map<String, dynamic> json) =>
      _$OptimizelyVariableFromJson(json);

  Map<String, dynamic> toJson() => _$OptimizelyVariableToJson(this);
}
