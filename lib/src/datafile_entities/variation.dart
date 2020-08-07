import 'package:optimizely/src/datafile_entities/variation_variable.dart';
part 'variation.g.dart';

class Variation {
  final String id;
  final String key;
  final List<VariationVariable> variables;
  final bool featureEnabled;

  Variation(this.id, this.key, this.variables, this.featureEnabled);

  factory Variation.fromJson(Map<String, dynamic> json) =>
      _$VariationFromJson(json);

  Map<String, dynamic> toJson() => _$VariationToJson(this);
}
