import 'package:optimizely/src/datafile_entities/experiment.dart';
part 'rollout.g.dart';

class Rollout {
  final String id;
  final List<Experiment> experiments;

  Rollout(this.id, this.experiments);

  factory Rollout.fromJson(Map<String, dynamic> json) =>
      _$RolloutFromJson(json);

  Map<String, dynamic> toJson() => _$RolloutToJson(this);
}
