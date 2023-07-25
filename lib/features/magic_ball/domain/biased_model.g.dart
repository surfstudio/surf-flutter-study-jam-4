// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biased_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Biased _$$_BiasedFromJson(Map<String, dynamic> json) => _$_Biased(
      reading: json['reading'] as String? ?? '',
      question: json['question'] as String? ?? '',
      sentiment: json['sentiment'] == null
          ? null
          : Sentiment.fromJson(json['sentiment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BiasedToJson(_$_Biased instance) => <String, dynamic>{
      'reading': instance.reading,
      'question': instance.question,
      'sentiment': instance.sentiment,
    };

_$_Sentiment _$$_SentimentFromJson(Map<String, dynamic> json) => _$_Sentiment(
      score: json['score'] as int? ?? 0,
      comparative: (json['comparative'] as num?)?.toDouble() ?? 0.0,
      calculation: (json['calculation'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : Calculation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tokens: (json['tokens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      words:
          (json['words'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      positive: (json['positive'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      negative: (json['negative'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_SentimentToJson(_$_Sentiment instance) =>
    <String, dynamic>{
      'score': instance.score,
      'comparative': instance.comparative,
      'calculation': instance.calculation,
      'tokens': instance.tokens,
      'words': instance.words,
      'positive': instance.positive,
      'negative': instance.negative,
    };

_$_Calculation _$$_CalculationFromJson(Map<String, dynamic> json) =>
    _$_Calculation(
      win: json['win'] as int? ?? 0,
    );

Map<String, dynamic> _$$_CalculationToJson(_$_Calculation instance) =>
    <String, dynamic>{
      'win': instance.win,
    };
