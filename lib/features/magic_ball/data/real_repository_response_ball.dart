import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:surf_practice_magic_ball/features/magic_ball/data/real_response_from_ball.dart';
import 'package:surf_practice_magic_ball/features/magic_ball/domain/random_reading_model.dart';

import 'fake_repository_response_ball.dart';

// just get data from api
class ResponseBallRepository implements ResponseBallRepositoryImpl {
  ResponseBallRepository(this.responseBallDataSource);

  final ResponseBallDataSource responseBallDataSource;

  @override
  Future<RandomReading> getRepsonseFromBall() async {
    return await responseBallDataSource.getResponseBall();
  }
}

final realResponseBallRepositoryProvider =
    Provider<ResponseBallRepositoryImpl>((ref) {
  final loginDataSource = ResponseBallDataSource(Dio());
  return ResponseBallRepository(loginDataSource);
});

