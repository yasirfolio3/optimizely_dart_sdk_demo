import 'package:optimizely/src/datafile_entities/experiment.dart';
import 'package:optimizely/src/datafile_entities/traffic_allocation.dart';
part 'group.g.dart';

class Group {
  final String id;
  final String policy;
  final List<TrafficAllocation> trafficAllocation;
  final List<Experiment> experiments;

  Group(this.id, this.policy, this.trafficAllocation, this.experiments);

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
