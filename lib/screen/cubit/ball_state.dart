class MagicBallState {
  const MagicBallState.init()
      : loading = true,
        prediction = '',
        error = null;
  const MagicBallState(this.loading, this.prediction, this.error);

  final bool loading;
  final String prediction;
  final String? error;

  MagicBallState copyWith({bool? loading, String? prediction, String? error}) => MagicBallState(
        loading ?? this.loading,
        prediction ?? this.prediction,
        error ?? this.error,
      );
}