import 'package:optimizely/src/config/optimizely_config/optimizelyvariation.dart';
part 'optimizelyexperiment.g.dart';

class OptimizelyExperiment {
  String id;
  String key;
  Map<String, OptimizelyVariation> variationsMap;

  OptimizelyExperiment(this.id, this.key, this.variationsMap);

  factory OptimizelyExperiment.fromJson(Map<String, dynamic> json) =>
      _$OptimizelyExperimentFromJson(json);

  Map<String, dynamic> toJson() => _$OptimizelyExperimentToJson(this);
}
