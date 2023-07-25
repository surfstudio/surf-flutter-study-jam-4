import 'dart:async';

import 'package:dio/dio.dart';
import 'package:shake/shake.dart';

abstract interface class MagicBallRepository {
  Future<String> getPrediction();
}

abstract interface class ShakeRepository {
  StreamSubscription<bool> listen(void Function(bool) handler);
}

class ShakeRepositoryImpl implements ShakeRepository {
  late final ShakeDetector _detector;
  final StreamController<bool> _stream;

  ShakeRepositoryImpl() : _stream = StreamController.broadcast() {
    _detector = ShakeDetector.waitForStart(onPhoneShake: () {
      _stream.add(true);
    });
    _detector.startListening();
  }

  @override
  StreamSubscription<bool> listen(void Function(bool p1) handler) {
    return _stream.stream.listen(handler);
  }
}

class MagicBallRepositoryImpl implements MagicBallRepository {
  final Dio _client;

  MagicBallRepositoryImpl(this._client);

  @override
  Future<String> getPrediction() async {
    final result = await _client.get('https://eightballapi.com/api');
    return result.data['reading'];
  }
}
