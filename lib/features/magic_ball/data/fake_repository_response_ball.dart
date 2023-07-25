import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:surf_practice_magic_ball/constans/response_ball_test.dart';
import 'package:surf_practice_magic_ball/features/magic_ball/domain/random_reading_model.dart';

// create abstract class for create conctract for fake(mock) and real repos
abstract class ResponseBallRepositoryImpl {
  Future<RandomReading> getRepsonseFromBall();
}

class FakeResponseBallRepository implements ResponseBallRepositoryImpl {
  final RandomReading _ballResponse = kTestRandomReading;

  @override
  Future<RandomReading> getRepsonseFromBall() async {
    // deley for checking loading state
    await Future.delayed(const Duration(milliseconds: 2000));
    return Future.value(_ballResponse);
  }
}

final fakeResponseBallRepositoryProvider =
    Provider<ResponseBallRepositoryImpl>((ref) {
  return FakeResponseBallRepository();
});
