part 'traffic_allocation.g.dart';

class TrafficAllocation {
  final String entityId;
  final int endOfRange;

  TrafficAllocation(this.entityId, this.endOfRange);

  factory TrafficAllocation.fromJson(Map<String, dynamic> json) =>
      _$TrafficAllocationFromJson(json);

  Map<String, dynamic> toJson() => _$TrafficAllocationToJson(this);
}
