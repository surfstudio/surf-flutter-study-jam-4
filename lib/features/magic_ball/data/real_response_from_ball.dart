import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:surf_practice_magic_ball/features/magic_ball/domain/random_reading_model.dart';

part 'real_response_from_ball.g.dart';

abstract class ResponseBallDataSourceImpl {
  Future<RandomReading> getResponseBall();
}

/// for autogenerate response logic
@RestApi(baseUrl: 'https://eightballapi.com/api')
abstract class ResponseBallDataSource implements ResponseBallDataSourceImpl {
  factory ResponseBallDataSource(Dio dio) = _ResponseBallDataSource;
  @override
  @GET('/')
  Future<RandomReading> getResponseBall();
}
