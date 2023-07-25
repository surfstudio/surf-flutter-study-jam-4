// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biased_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Biased _$BiasedFromJson(Map<String, dynamic> json) {
  return _Biased.fromJson(json);
}

/// @nodoc
mixin _$Biased {
  String get reading => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  Sentiment? get sentiment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BiasedCopyWith<Biased> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BiasedCopyWith<$Res> {
  factory $BiasedCopyWith(Biased value, $Res Function(Biased) then) =
      _$BiasedCopyWithImpl<$Res, Biased>;
  @useResult
  $Res call({String reading, String question, Sentiment? sentiment});

  $SentimentCopyWith<$Res>? get sentiment;
}

/// @nodoc
class _$BiasedCopyWithImpl<$Res, $Val extends Biased>
    implements $BiasedCopyWith<$Res> {
  _$BiasedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reading = null,
    Object? question = null,
    Object? sentiment = freezed,
  }) {
    return _then(_value.copyWith(
      reading: null == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      sentiment: freezed == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as Sentiment?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SentimentCopyWith<$Res>? get sentiment {
    if (_value.sentiment == null) {
      return null;
    }

    return $SentimentCopyWith<$Res>(_value.sentiment!, (value) {
      return _then(_value.copyWith(sentiment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BiasedCopyWith<$Res> implements $BiasedCopyWith<$Res> {
  factory _$$_BiasedCopyWith(_$_Biased value, $Res Function(_$_Biased) then) =
      __$$_BiasedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reading, String question, Sentiment? sentiment});

  @override
  $SentimentCopyWith<$Res>? get sentiment;
}

/// @nodoc
class __$$_BiasedCopyWithImpl<$Res>
    extends _$BiasedCopyWithImpl<$Res, _$_Biased>
    implements _$$_BiasedCopyWith<$Res> {
  __$$_BiasedCopyWithImpl(_$_Biased _value, $Res Function(_$_Biased) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reading = null,
    Object? question = null,
    Object? sentiment = freezed,
  }) {
    return _then(_$_Biased(
      reading: null == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      sentiment: freezed == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as Sentiment?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Biased implements _Biased {
  _$_Biased({this.reading = '', this.question = '', this.sentiment});

  factory _$_Biased.fromJson(Map<String, dynamic> json) =>
      _$$_BiasedFromJson(json);

  @override
  @JsonKey()
  final String reading;
  @override
  @JsonKey()
  final String question;
  @override
  final Sentiment? sentiment;

  @override
  String toString() {
    return 'Biased(reading: $reading, question: $question, sentiment: $sentiment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Biased &&
            (identical(other.reading, reading) || other.reading == reading) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.sentiment, sentiment) ||
                other.sentiment == sentiment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reading, question, sentiment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BiasedCopyWith<_$_Biased> get copyWith =>
      __$$_BiasedCopyWithImpl<_$_Biased>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BiasedToJson(
      this,
    );
  }
}

abstract class _Biased implements Biased {
  factory _Biased(
      {final String reading,
      final String question,
      final Sentiment? sentiment}) = _$_Biased;

  factory _Biased.fromJson(Map<String, dynamic> json) = _$_Biased.fromJson;

  @override
  String get reading;
  @override
  String get question;
  @override
  Sentiment? get sentiment;
  @override
  @JsonKey(ignore: true)
  _$$_BiasedCopyWith<_$_Biased> get copyWith =>
      throw _privateConstructorUsedError;
}

Sentiment _$SentimentFromJson(Map<String, dynamic> json) {
  return _Sentiment.fromJson(json);
}

/// @nodoc
mixin _$Sentiment {
  int get score => throw _privateConstructorUsedError;
  double get comparative => throw _privateConstructorUsedError;
  List<Calculation?> get calculation => throw _privateConstructorUsedError;
  List<String> get tokens => throw _privateConstructorUsedError;
  List<String> get words => throw _privateConstructorUsedError;
  List<String> get positive => throw _privateConstructorUsedError;
  List<String> get negative => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SentimentCopyWith<Sentiment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SentimentCopyWith<$Res> {
  factory $SentimentCopyWith(Sentiment value, $Res Function(Sentiment) then) =
      _$SentimentCopyWithImpl<$Res, Sentiment>;
  @useResult
  $Res call(
      {int score,
      double comparative,
      List<Calculation?> calculation,
      List<String> tokens,
      List<String> words,
      List<String> positive,
      List<String> negative});
}

/// @nodoc
class _$SentimentCopyWithImpl<$Res, $Val extends Sentiment>
    implements $SentimentCopyWith<$Res> {
  _$SentimentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? comparative = null,
    Object? calculation = null,
    Object? tokens = null,
    Object? words = null,
    Object? positive = null,
    Object? negative = null,
  }) {
    return _then(_value.copyWith(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      comparative: null == comparative
          ? _value.comparative
          : comparative // ignore: cast_nullable_to_non_nullable
              as double,
      calculation: null == calculation
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as List<Calculation?>,
      tokens: null == tokens
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      words: null == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
      positive: null == positive
          ? _value.positive
          : positive // ignore: cast_nullable_to_non_nullable
              as List<String>,
      negative: null == negative
          ? _value.negative
          : negative // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SentimentCopyWith<$Res> implements $SentimentCopyWith<$Res> {
  factory _$$_SentimentCopyWith(
          _$_Sentiment value, $Res Function(_$_Sentiment) then) =
      __$$_SentimentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int score,
      double comparative,
      List<Calculation?> calculation,
      List<String> tokens,
      List<String> words,
      List<String> positive,
      List<String> negative});
}

/// @nodoc
class __$$_SentimentCopyWithImpl<$Res>
    extends _$SentimentCopyWithImpl<$Res, _$_Sentiment>
    implements _$$_SentimentCopyWith<$Res> {
  __$$_SentimentCopyWithImpl(
      _$_Sentiment _value, $Res Function(_$_Sentiment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? comparative = null,
    Object? calculation = null,
    Object? tokens = null,
    Object? words = null,
    Object? positive = null,
    Object? negative = null,
  }) {
    return _then(_$_Sentiment(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      comparative: null == comparative
          ? _value.comparative
          : comparative // ignore: cast_nullable_to_non_nullable
              as double,
      calculation: null == calculation
          ? _value._calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as List<Calculation?>,
      tokens: null == tokens
          ? _value._tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
      positive: null == positive
          ? _value._positive
          : positive // ignore: cast_nullable_to_non_nullable
              as List<String>,
      negative: null == negative
          ? _value._negative
          : negative // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Sentiment implements _Sentiment {
  _$_Sentiment(
      {this.score = 0,
      this.comparative = 0.0,
      final List<Calculation?> calculation = const [],
      final List<String> tokens = const [],
      final List<String> words = const [],
      final List<String> positive = const [],
      final List<String> negative = const []})
      : _calculation = calculation,
        _tokens = tokens,
        _words = words,
        _positive = positive,
        _negative = negative;

  factory _$_Sentiment.fromJson(Map<String, dynamic> json) =>
      _$$_SentimentFromJson(json);

  @override
  @JsonKey()
  final int score;
  @override
  @JsonKey()
  final double comparative;
  final List<Calculation?> _calculation;
  @override
  @JsonKey()
  List<Calculation?> get calculation {
    if (_calculation is EqualUnmodifiableListView) return _calculation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_calculation);
  }

  final List<String> _tokens;
  @override
  @JsonKey()
  List<String> get tokens {
    if (_tokens is EqualUnmodifiableListView) return _tokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tokens);
  }

  final List<String> _words;
  @override
  @JsonKey()
  List<String> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  final List<String> _positive;
  @override
  @JsonKey()
  List<String> get positive {
    if (_positive is EqualUnmodifiableListView) return _positive;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_positive);
  }

  final List<String> _negative;
  @override
  @JsonKey()
  List<String> get negative {
    if (_negative is EqualUnmodifiableListView) return _negative;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_negative);
  }

  @override
  String toString() {
    return 'Sentiment(score: $score, comparative: $comparative, calculation: $calculation, tokens: $tokens, words: $words, positive: $positive, negative: $negative)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Sentiment &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.comparative, comparative) ||
                other.comparative == comparative) &&
            const DeepCollectionEquality()
                .equals(other._calculation, _calculation) &&
            const DeepCollectionEquality().equals(other._tokens, _tokens) &&
            const DeepCollectionEquality().equals(other._words, _words) &&
            const DeepCollectionEquality().equals(other._positive, _positive) &&
            const DeepCollectionEquality().equals(other._negative, _negative));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      score,
      comparative,
      const DeepCollectionEquality().hash(_calculation),
      const DeepCollectionEquality().hash(_tokens),
      const DeepCollectionEquality().hash(_words),
      const DeepCollectionEquality().hash(_positive),
      const DeepCollectionEquality().hash(_negative));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SentimentCopyWith<_$_Sentiment> get copyWith =>
      __$$_SentimentCopyWithImpl<_$_Sentiment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SentimentToJson(
      this,
    );
  }
}

abstract class _Sentiment implements Sentiment {
  factory _Sentiment(
      {final int score,
      final double comparative,
      final List<Calculation?> calculation,
      final List<String> tokens,
      final List<String> words,
      final List<String> positive,
      final List<String> negative}) = _$_Sentiment;

  factory _Sentiment.fromJson(Map<String, dynamic> json) =
      _$_Sentiment.fromJson;

  @override
  int get score;
  @override
  double get comparative;
  @override
  List<Calculation?> get calculation;
  @override
  List<String> get tokens;
  @override
  List<String> get words;
  @override
  List<String> get positive;
  @override
  List<String> get negative;
  @override
  @JsonKey(ignore: true)
  _$$_SentimentCopyWith<_$_Sentiment> get copyWith =>
      throw _privateConstructorUsedError;
}

Calculation _$CalculationFromJson(Map<String, dynamic> json) {
  return _Calculation.fromJson(json);
}

/// @nodoc
mixin _$Calculation {
  int get win => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalculationCopyWith<Calculation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculationCopyWith<$Res> {
  factory $CalculationCopyWith(
          Calculation value, $Res Function(Calculation) then) =
      _$CalculationCopyWithImpl<$Res, Calculation>;
  @useResult
  $Res call({int win});
}

/// @nodoc
class _$CalculationCopyWithImpl<$Res, $Val extends Calculation>
    implements $CalculationCopyWith<$Res> {
  _$CalculationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? win = null,
  }) {
    return _then(_value.copyWith(
      win: null == win
          ? _value.win
          : win // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalculationCopyWith<$Res>
    implements $CalculationCopyWith<$Res> {
  factory _$$_CalculationCopyWith(
          _$_Calculation value, $Res Function(_$_Calculation) then) =
      __$$_CalculationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int win});
}

/// @nodoc
class __$$_CalculationCopyWithImpl<$Res>
    extends _$CalculationCopyWithImpl<$Res, _$_Calculation>
    implements _$$_CalculationCopyWith<$Res> {
  __$$_CalculationCopyWithImpl(
      _$_Calculation _value, $Res Function(_$_Calculation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? win = null,
  }) {
    return _then(_$_Calculation(
      win: null == win
          ? _value.win
          : win // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Calculation implements _Calculation {
  _$_Calculation({this.win = 0});

  factory _$_Calculation.fromJson(Map<String, dynamic> json) =>
      _$$_CalculationFromJson(json);

  @override
  @JsonKey()
  final int win;

  @override
  String toString() {
    return 'Calculation(win: $win)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Calculation &&
            (identical(other.win, win) || other.win == win));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, win);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalculationCopyWith<_$_Calculation> get copyWith =>
      __$$_CalculationCopyWithImpl<_$_Calculation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CalculationToJson(
      this,
    );
  }
}

abstract class _Calculation implements Calculation {
  factory _Calculation({final int win}) = _$_Calculation;

  factory _Calculation.fromJson(Map<String, dynamic> json) =
      _$_Calculation.fromJson;

  @override
  int get win;
  @override
  @JsonKey(ignore: true)
  _$$_CalculationCopyWith<_$_Calculation> get copyWith =>
      throw _privateConstructorUsedError;
}
