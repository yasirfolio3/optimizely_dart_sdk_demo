import 'package:optimizely/src/config/optimizely_config/optimizely_variable.dart';
part 'optimizely_variation.g.dart';

class OptimizelyVariation {
  String id;
  String key;
  bool featureEnabled;
  Map<String, OptimizelyVariable> variablesMap;

  OptimizelyVariation(
      this.id, this.key, this.featureEnabled, this.variablesMap);

  factory OptimizelyVariation.fromJson(Map<String, dynamic> json) =>
      _$OptimizelyVariationFromJson(json);

  Map<String, dynamic> toJson() => _$OptimizelyVariationToJson(this);
}
