//! Not use now, model for second api !//

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'biased_model.freezed.dart';
part 'biased_model.g.dart';

@freezed
class Biased with _$Biased {
  factory Biased({
    @Default('') String reading,
    @Default('') String question,
    Sentiment? sentiment,
  }) = _Biased;

  factory Biased.fromJson(Map<String, Object?> json) => _$BiasedFromJson(json);
}

@freezed
class Sentiment with _$Sentiment {
  factory Sentiment({
    @Default(0) int score,
    @Default(0.0) double comparative,
    @Default([]) List<Calculation?> calculation,
    @Default([]) List<String> tokens,
    @Default([]) List<String> words,
    @Default([]) List<String> positive,
    @Default([]) List<String> negative,
  }) = _Sentiment;

  factory Sentiment.fromJson(Map<String, Object?> json) =>
      _$SentimentFromJson(json);
}

@freezed
class Calculation with _$Calculation {
  factory Calculation({@Default(0) int win}) = _Calculation;

  factory Calculation.fromJson(Map<String, Object?> json) =>
      _$CalculationFromJson(json);
}
