import 'package:optimizely/src/datafile_entities/traffic_allocation.dart';
import 'package:optimizely/src/datafile_entities/variation.dart';
part 'experiment.g.dart';

class Experiment {
  final String id;
  final String key;
  final String layerId;
  final String status;
  final List<Variation> variations;
  final List<TrafficAllocation> trafficAllocation;
  final List<String> audienceIds;
  final Map<String, String> forcedVariations;
  final dynamic audienceConditions;

  Experiment(
      this.id,
      this.key,
      this.layerId,
      this.status,
      this.variations,
      this.trafficAllocation,
      this.audienceIds,
      this.forcedVariations,
      this.audienceConditions);

  factory Experiment.fromJson(Map<String, dynamic> json) =>
      _$ExperimentFromJson(json);

  Map<String, dynamic> toJson() => _$ExperimentToJson(this);
}
