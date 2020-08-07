part 'event.g.dart';

class Event {
  final String id;
  final String key;
  final List<String> experimentIds;

  Event(this.id, this.key, this.experimentIds);

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
