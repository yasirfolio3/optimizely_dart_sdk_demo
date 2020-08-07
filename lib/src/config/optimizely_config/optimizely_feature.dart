import 'package:optimizely/src/config/optimizely_config/optimizely_experiment.dart';
import 'package:optimizely/src/config/optimizely_config/optimizely_variable.dart';
part 'optimizely_feature.g.dart';

class OptimizelyFeature {
  String id;
  String key;
  Map<String, OptimizelyExperiment> experimentsMap;
  Map<String, OptimizelyVariable> variablesMap;

  OptimizelyFeature(this.id, this.key, this.experimentsMap, this.variablesMap);

  factory OptimizelyFeature.fromJson(Map<String, dynamic> json) =>
      _$OptimizelyFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$OptimizelyFeatureToJson(this);
}
