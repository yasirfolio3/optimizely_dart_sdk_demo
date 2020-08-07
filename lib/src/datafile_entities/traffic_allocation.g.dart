part of 'traffic_allocation.dart';

TrafficAllocation _$TrafficAllocationFromJson(Map<String, dynamic> json) {
  return TrafficAllocation(
    json['entityId'] as String,
    json['endOfRange'] as int,
  );
}

Map<String, dynamic> _$TrafficAllocationToJson(TrafficAllocation instance) =>
    <String, dynamic>{
      'entityId': instance.entityId,
      'endOfRange': instance.endOfRange,
    };
