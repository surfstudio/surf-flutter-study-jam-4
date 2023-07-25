class MagicBall {
  String? reading;
  MagicBallState state;

  MagicBall(this.state);
}

enum MagicBallState { waiting, reading, error }
