part 'variable.g.dart';

class Variable {
  final String defaultValue;
  final String id;
  final String key;
  final String type;
  final String subType;

  Variable(this.defaultValue, this.id, this.key, this.type, this.subType);

  factory Variable.fromJson(Map<String, dynamic> json) =>
      _$VariableFromJson(json);

  Map<String, dynamic> toJson() => _$VariableToJson(this);
}
