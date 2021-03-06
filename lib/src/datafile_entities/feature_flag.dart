import 'package:optimizely/src/datafile_entities/variable.dart';
part 'feature_flag.g.dart';

class FeatureFlag {
  final String id;
  final String rolloutId;
  final String key;
  final List<String> experimentIds;
  final List<Variable> variables;

  FeatureFlag(
      this.id, this.rolloutId, this.key, this.experimentIds, this.variables);

  factory FeatureFlag.fromJson(Map<String, dynamic> json) =>
      _$FeatureFlagFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureFlagToJson(this);
}
