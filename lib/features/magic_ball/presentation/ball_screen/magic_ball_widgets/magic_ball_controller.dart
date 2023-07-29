import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:surf_practice_magic_ball/features/magic_ball/data/fake_repository_response_ball.dart';
import 'package:surf_practice_magic_ball/features/magic_ball/data/real_repository_response_ball.dart';
import 'package:surf_practice_magic_ball/features/magic_ball/domain/random_reading_model.dart';

// controller for get data about ball response
class ResponseBallController extends AutoDisposeAsyncNotifier<RandomReading?> {
  ResponseBallController(
      {this.fakeData = false}); // when need use fake(mock) data

  final bool fakeData;

  @override
  FutureOr<RandomReading?> build() {
    return null;
  }

  Future<void> getBallResponse() async {
    // with check when call this func guard from repeate request
    ref.read(timeoutProvider.notifier).state = false;

    if (Platform.isAndroid || Platform.isIOS) {
      // add vibrate effect for user
      bool canVibrate = await Vibrate.canVibrate;
      if (canVibrate) {
        Vibrate.vibrate();
      }
    }

    final ResponseBallRepositoryImpl responseBallRepository;
    // choose our repo
    if (fakeData) {
      responseBallRepository = ref.read(fakeResponseBallRepositoryProvider);
    } else {
      responseBallRepository = ref.read(realResponseBallRepositoryProvider);
    }
    state = const AsyncLoading();
    // syntax sugar replacment try/catch bloc
    await Future.delayed(const Duration(milliseconds: 2000));
    state = AsyncValue.data(RandomReading(reading: 'value'));
    // state = await AsyncValue.guard(
    //   () => responseBallRepository.getRepsonseFromBall(),
    // );
    await Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      ref.read(timeoutProvider.notifier).state =
          true; // after this, can do query
    });
  }
}

final responseBallControllerProvider =
    AutoDisposeAsyncNotifierProvider<ResponseBallController, RandomReading?>(
  ResponseBallController.new,
);

final timeoutProvider = StateProvider<bool>((ref) {
  return true;
});
