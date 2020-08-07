part 'audience.g.dart';

class Audience {
  final String id;
  final String name;
  final dynamic conditions;

  Audience(this.id, this.name, this.conditions);

  factory Audience.fromJson(Map<String, dynamic> json) =>
      _$AudienceFromJson(json);

  Map<String, dynamic> toJson() => _$AudienceToJson(this);
}
