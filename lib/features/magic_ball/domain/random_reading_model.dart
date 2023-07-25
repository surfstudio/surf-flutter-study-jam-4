// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'random_reading_model.g.dart';

@JsonSerializable()
class RandomReading {
  final String reading;

  RandomReading({required this.reading});

  factory RandomReading.fromJson(Map<String, dynamic> json) =>
      _$RandomReadingFromJson(json);

  Map<String, dynamic> toJson() => _$RandomReadingToJson(this);

  @override
  String toString() => 'RandomReading(reading: $reading)';
}
